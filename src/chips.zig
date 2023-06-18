const std = @import("std");
const microzig = @import("../deps/microzig/build.zig");

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

pub const ATmega32U4 = microzig.Chip{
    .name = "ATmega32U4",
    .cpu = microzig.cpus.avr5,
    .json_register_schema = .{ .path = root_dir() ++ "/chips/atmega32u4.atdf.json" },
    .source = .{ .path = root_dir() ++ "/chips/atmega32u4.atdf.zig" },
    .memory_regions = &.{
        microzig.MemoryRegion{ .offset = 0x000_000, .length = 32 * 1024, .kind = .flash },
        microzig.MemoryRegion{ .offset = 0x100, .length = 2048 + 512, .kind = .ram },
    },
};
