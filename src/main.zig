const micro = @import("microzig");
const unstable = micro.core.experimental;
const std = @import("std");
const hal = micro.hal;
const Time = hal.Time;

//https://zeg.random-projects.net/getting-started.htm
//https://github.com/ZigEmbeddedGroup/microzig/blob/main/test/programs/blinky.zig
// from wiring.c

fn timer_init() void {
    micro.hal.assign_vector(24, &struct {
        fn timer0_ovf() callconv(.C) void {
            var mills: u32 = Time.timer0_millis;
            var fract: u32 = Time.timer0_fract;
            mills += Time.MILLI_INCREMENT;
            fract += Time.FRACT_INCREMENT;
            if (fract > Time.FRACT_MAX) {
                fract -= Time.FRACT_MAX;
                mills += 1;
            }
            // Do I need to do this?
            @as(*volatile u32, &Time.timer0_fract).* = fract;
            @as(*volatile u32, &Time.timer0_millis).* = mills;
            @as(*volatile u32, &Time.timer0_overflow_count).* += 1;
        }
    }.timer0_ovf);
}

pub fn main() void {
    timer_init();
    const led_pin = unstable.Pin("D13");
    const led = unstable.gpio.Gpio(led_pin, .{ .mode = .output, .initial_state = .low });
    led.init();
    _ = Time.millis();
    while (true) {
        Time.delay(500, true);
        // busyloop();
        led.toggle();
    }
}

fn busyloop() void {
    const limit = 6_000_000;
    var i: u24 = 0;
    while (i < limit) : (i += 1) {
        // @import("std").mem.doNotOptimizeAway(i);
        asm volatile ("nop");
    }
}
