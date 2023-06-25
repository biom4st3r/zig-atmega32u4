const std = @import("std");
const micro = @import("microzig");
const USART1 = micro.chip.types.peripherals.USART.USART1;

const unstable = micro.core.experimental.gpio;

pub const vector_base_address: usize = 0x0002;
pub const vector_table: *[42]usize = @ptrFromInt(*[42]usize, vector_base_address);
pub inline fn assign_vector(vector: u8, handler: *const fn () callconv(.C) void) void {
    vector_table[vector - 1] = @intFromPtr(handler);
}

pub const clock = struct {
    pub const Domain = enum {
        cpu,
    };
};

// All relavent addresses for referring to the port
// Derived from datasheet
fn Port(comptime io: u8) type {
    return struct {
        pub const io_port = io;
        pub const io_dir = io - 1;
        pub const io_pin = io - 2;

        pub const mem = @ptrFromInt(*volatile u8, io_pin + 0x20);
    };
}

const Ports = struct {
    pub const F = Port(0x11);
    pub const E = Port(0x0E);
    pub const D = Port(0x0B);
    pub const C = Port(0x08);
    pub const B = Port(0x05);
};

fn PortPin(comptime po: type, comptime pi: u3) type {
    return struct {
        pub const port = po;
        pub const pin = pi;
    };
}

pub fn parse_pin(comptime spec: []const u8) type {
    // Should be P[B-F][0-7] tho some of those don't exist
    if (spec.len != 3) @compileError("Pin Name to long to exist: " ++ spec);
    const PORT = spec[1];
    const PIN = std.fmt.parseInt(u3, &.{spec[2]}, 10) catch unreachable;
    switch (PORT) {
        'F' => return PortPin(Ports.F, PIN),
        'E' => return PortPin(Ports.E, PIN),
        'D' => return PortPin(Ports.D, PIN),
        'C' => return PortPin(Ports.C, PIN),
        'B' => return PortPin(Ports.B, PIN),
        else => @compileError("Invalid Port" ++ spec),
    }
}

pub const Time = struct {
    const CYCLES_PER_MICRO = @divFloor(micro.board.clock_frequencies.cpu, 1_000_000);
    inline fn cycles_to_micro(a: u32) u32 {
        return @divFloor(a, CYCLES_PER_MICRO);
    }
    pub const MICROS_PER_T0_OVF = cycles_to_micro(64 * 256);
    pub const MILLI_INCREMENT = @divFloor(MICROS_PER_T0_OVF, 1000);

    pub const FRACT_INCREMENT = (MICROS_PER_T0_OVF % 1000) >> 3;
    pub const FRACT_MAX = (1000 >> 3);

    pub var timer0_overflow_count: u32 = 0;
    pub var timer0_millis: u32 = 0;
    pub var timer0_fract: u32 = 0;

    pub fn millis() u32 {
        var m: u32 = 0;
        var old = micro.hal.SREG.*;
        defer micro.hal.SREG.* = old;
        micro.cpu.disable_interrupts();
        m = timer0_millis;
        return m;
    }

    pub fn delay(ms: u32, comptime busy: bool) void {
        var ms_ = ms;
        var start = Time.millis();
        while (ms_ > 0) {
            comptime if (!busy) {
                suspend .{};
            };
            if (busy) asm volatile ("nop");
            while ((ms_ > 0) and ((Time.millis() - start) >= 1)) {
                ms_ -= 1;
                start += 1;
            }
        }
    }
};

pub const gpio = struct {
    pub fn setOutput(comptime pp: type) void {
        micro.cpu.sbi(pp.port.io_dir, pp.pin);
    }
    pub fn setInput(comptime pp: type) void {
        micro.cpu.cbi(pp.port.io_dir, pp.pin);
    }
    pub fn read(comptime pp: type) unstable.State {
        return if (pp.port.mem.* & (1 << pp.pin) != 0) .high else .low;
    }
    pub fn write(comptime pp: type, state: unstable.State) void {
        if (state == .high) {
            // @compileLog(pp);
            micro.cpu.sbi(pp.port.io_port, pp.pin);
        } else {
            micro.cpu.cbi(pp.port.io_port, pp.pin);
        }
    }
    pub fn toggle(comptime pp: type) void {
        micro.cpu.sbi(pp.port.io_pin, pp.pin);
    }
};

pub const uart = struct {
    pub const DataBits = enum {
        five,
        six,
        seven,
        eight,
        nine,
    };

    pub const StopBits = enum {
        one,
        two,
    };

    pub const Parity = enum {
        odd,
        even,
    };
};

pub fn Uart(comptime index: usize, comptime pins: micro.core.experimental.uart.Pins) type {
    if (index != 0) @compileError("Atmega328p only has a single uart!");
    if (pins.tx != null or pins.rx != null)
        @compileError("Atmega328p has fixed pins for uart!");

    return struct {
        const Self = @This();

        fn computeDivider(baud_rate: u32) !u12 {
            const pclk = micro.core.experimental.clock.get().cpu;
            const divider = ((pclk + (8 * baud_rate)) / (16 * baud_rate)) - 1;

            return std.math.cast(u12, divider) orelse return error.UnsupportedBaudRate;
        }

        fn computeBaudRate(divider: u12) u32 {
            return micro.core.experimental.clock.get().cpu / (16 * @as(u32, divider) + 1);
        }

        pub fn init(config: micro.core.experimental.uart.Config) !Self {
            const ucsz: u3 = switch (config.data_bits) {
                .five => 0b000,
                .six => 0b001,
                .seven => 0b010,
                .eight => 0b011,
                .nine => return error.UnsupportedWordSize, // 0b111
            };

            const upm: u2 = if (config.parity) |parity| switch (parity) {
                .even => @as(u2, 0b10), // even
                .odd => @as(u2, 0b11), // odd
            } else 0b00; // parity disabled

            const usbs: u1 = switch (config.stop_bits) {
                .one => 0b0,
                .two => 0b1,
            };

            const umsel: u2 = 0b00; // Asynchronous USART

            // baud is computed like this:
            //             f(osc)
            // BAUD = ----------------
            //        16 * (UBRRn + 1)

            const ubrr_val = try computeDivider(config.baud_rate);

            USART1.UCSR1A.modify(.{
                .MPCM0 = 0,
                .U2X0 = 0,
            });
            USART1.UCSR1B.write(.{
                .TXB80 = 0, // we don't care about these btw
                .RXB80 = 0, // we don't care about these btw
                .UCSZ02 = @truncate(u1, (ucsz & 0x04) >> 2),
                .TXEN0 = 1,
                .RXEN0 = 1,
                .UDRIE0 = 0, // no interrupts
                .TXCIE0 = 0, // no interrupts
                .RXCIE0 = 0, // no interrupts
            });
            USART1.UCSR1C.write(.{
                .UCPOL0 = 0, // async mode
                .UCSZ0 = @truncate(u2, (ucsz & 0x03) >> 0),
                .USBS0 = usbs,
                .UPM0 = upm,
                .UMSEL0 = umsel,
            });

            USART1.UBRR1.modify(ubrr_val);

            return Self{};
        }

        pub fn canWrite(self: Self) bool {
            _ = self;
            return (USART1.UCSR1A.read().UDRE0 == 1);
        }

        pub fn tx(self: Self, ch: u8) void {
            while (!self.canWrite()) {} // Wait for Previous transmission
            USART1.UDR1.* = ch; // Load the data to be transmitted
        }

        pub fn canRead(self: Self) bool {
            _ = self;
            return (USART1.UCSR1A.read().RXC0 == 1);
        }

        pub fn rx(self: Self) u8 {
            while (!self.canRead()) {} // Wait till the data is received
            return USART1.UDR1.*; // Read received data
        }
    };
}
