const std = @import("std");
const microzig = @import("../deps/microzig/build.zig");

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

pub const adafruit_itsybitsy_32u4 = microzig.Board{
    .name = "Adafruit ItsyBitsy 32u4",
    .source = .{ .path = root_dir() ++ "/boards/adafruit_itsybitsy_32u4.zig" },
    .chip = @import("chips.zig").ATmega32U4,
};
