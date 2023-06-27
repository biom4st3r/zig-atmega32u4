const micro = @import("microzig");
const unstable = micro.core.experimental;
const std = @import("std");
const hal = micro.hal;
const Time = hal.Time;
// const peri = @import("chips/ATmega32U4.zig").devices.ATmega32U4.peripherals; //micro.chip.peripherals;

//https://zeg.random-projects.net/getting-started.htm
//https://github.com/ZigEmbeddedGroup/microzig/blob/main/test/programs/blinky.zig
// from wiring.c

// pub const microzig_options = hal.microzig_options;

pub fn main() !void {
    // var uart = hal.default_uart.init(.{ .baud_rate = 9600 });
    const led_pin = unstable.Pin("D13");
    const led = unstable.gpio.Gpio(led_pin, .{ .mode = .output, .initial_state = .low });
    led.init();

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

fn busyloop() void {
    const limit = 1_000_000;
    var i: u24 = 0;
    while (i < limit) : (i += 1) {
        // @import("std").mem.doNotOptimizeAway(i);
        asm volatile ("nop");
    }
}
