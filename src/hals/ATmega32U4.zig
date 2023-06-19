const std = @import("std");
const micro = @import("microzig");

const unstable = micro.core.experimental.gpio;

// All relavent addresses for referring to the port
// Derived from datasheet
fn Port(comptime io: u8) type {
    return struct {
        pub const io_port = io;
        pub const io_dir = io - 1;
        pub const io_pin = io - 2;

        pub const mem = @intToPtr(*volatile u8, io_pin + 0x20);
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
            micro.cpu.sbi(pp.port.io_port, pp.pin);
        } else {
            micro.cpu.cbi(pp.port.io_port, pp.pin);
        }
    }

    pub fn toggle(comptime pp: type) void {
        micro.cpu.sbi(pp.port.io_pin, pp.pin);
    }
};
