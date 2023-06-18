const std = @import("std");
const microzig = @import("../deps/microzig/build.zig");

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

pub const ATmega32U4 = microzig.Chip.from_standard_paths(root_dir(), .{
    .name = "ATmega32U4",
    .cpu = microzig.cpus.avr5,
    .memory_regions = &.{
        // From Datasheet 5. AVR Memories
        // https://ww1.microchip.com/downloads/en/devicedoc/atmel-7766-8-bit-avr-atmega16u4-32u4_datasheet.pdf
        microzig.MemoryRegion{ .offset = 0x000_000, .length = 32 * 1024, .kind = .flash },
        microzig.MemoryRegion{ .offset = 0x800100, .length = 2048 + 512, .kind = .ram },
        // Why isn't this 0x100? That's what it says in the datasheet? but
        // https://github.com/ZigEmbeddedGroup/microchip-atmega/blob/main/src/chips.zig
        // has 0x800100 and 0x100 gives build errors
    },
});
