const micro = @import("microzig");
const unstable = micro.core.experimental;
const std = @import("std");
const hal = micro.hal;
const Time = hal.Time;
//micro.chip.peripherals;
// const peri = if (false) @import("chips/ATmega32U4.zig").devices.ATmega32U4.peripherals else void;

//https://zeg.random-projects.net/getting-started.htm
//https://github.com/ZigEmbeddedGroup/microzig/blob/main/test/programs/blinky.zig
// from wiring.c

// pub const microzig_options = hal.microzig_options;

pub fn main() !void {

    // var uart = hal.default_uart.init(.{ .baud_rate = 9600 });
    const led = unstable.gpio.Gpio(unstable.Pin("D13"), .{ .mode = .output, .initial_state = .low });
    led.init();
    // const d12 = unstable.gpio.Gpio(unstable.Pin("D12"), .{ .mode = .output, .initial_state = .low });
    // d12.init();
    // const d11 = unstable.gpio.Gpio(unstable.Pin("D11"), .{ .mode = .output, .initial_state = .low });
    // d11.init();
    // const d10 = unstable.gpio.Gpio(unstable.Pin("D10"), .{ .mode = .output, .initial_state = .low });
    // d10.init();
    // const d9 = unstable.gpio.Gpio(unstable.Pin("D9"), .{ .mode = .output, .initial_state = .low });
    // d9.init();

    while (true) {
        // for ("Hello World!\n") |char| {
        //     uart.tx(char);
        //     busyloop();
        // }
        // Time.delay(500, true);
        busyloop();
        led.write(.low);
        busyloop();
        led.write(.high);
    }
}

inline fn busyloop() void {
    const limit = 8_000_000;
    var i: u24 = 0;
    while (i < limit) : (i += 1) {
        // @import("std").mem.doNotOptimizeAway(i);
        asm volatile ("nop");
    }
}
