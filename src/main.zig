const micro = @import("microzig");
const unstable = micro.core.experimental;
//https://zeg.random-projects.net/getting-started.htm
//https://github.com/ZigEmbeddedGroup/microzig/blob/main/test/programs/blinky.zig
pub fn main() void {
    const led_pin = unstable.Pin("D13");
    const led = unstable.gpio.Gpio(led_pin, .{ .mode = .output, .initial_state = .low });
    led.init();
    while (true) {
        busyloop();
        led.toggle();
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
