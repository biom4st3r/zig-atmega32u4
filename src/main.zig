const micro = @import("microzig");
const unstable = micro.core.experimental;
const std = @import("std");
const hal = micro.hal;
const Time = hal.Time;

//https://zeg.random-projects.net/getting-started.htm
//https://github.com/ZigEmbeddedGroup/microzig/blob/main/test/programs/blinky.zig
// from wiring.c

// pub const microzig_options = hal.microzig_options;

pub fn main() !void {
    var uart = try micro.hal.Uart(0, .{ .tx = null, .rx = null }).init(.{ .baud_rate = 9600 });
    // timer_init();
    // const led_pin = unstable.Pin("D13");
    // const led = unstable.gpio.Gpio(led_pin, .{ .mode = .output, .initial_state = .low });
    // led.init();
    // _ = Time.millis();
    while (true) {
        for ("Hello World!\n") |char| {
            uart.tx(char);
            busyloop();
        }
        // Time.delay(500, true);
        // busyloop();
        // led.write(.low);
        // busyloop();
        // led.write(.high);
    }
}

fn busyloop() void {
    const limit = 100_000;
    var i: u24 = 0;
    while (i < limit) : (i += 1) {
        // @import("std").mem.doNotOptimizeAway(i);
        asm volatile ("nop");
    }
}
