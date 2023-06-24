const std = @import("std");
const micro = @import("microzig");

const unstable = micro.core.experimental.gpio;
// const T_SREG = micro.chip.types.peripherals.CPU.SREG;
pub const T_SREG = packed struct(u8) {
    I: u1, // Global interupt enable
    T: u1, // Bit Copy Storage
    H: u1, // Half Carry Falg
    S: u1, // Sign Bit
    V: u1, // Two Complement Overflow Flag
    N: u1, // Negative Flag
    Z: u1, // Zero Flag
    C: u1, // Carry Flag
};

pub var SREG: *volatile T_SREG = @ptrFromInt(*T_SREG, 0x3F);

pub const vector_base_address: usize = 0x0002;
pub const vector_table: *[42]usize = @ptrFromInt(*[42]usize, vector_base_address);
pub inline fn assign_vector(vector: u8, handler: *const fn () callconv(.C) void) void {
    vector_table[vector - 1] = @intFromPtr(handler);
}

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
