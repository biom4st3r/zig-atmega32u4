const std = @import("std");
const microzig = @import("deps/microzig/build.zig");

pub const boards = @import("src/boards.zig");
pub const chips = @import("src/chips.zig");

const itsybitsy = @import("src/boards.zig").adafruit_itsybitsy_32u4;

pub fn build(b: *std.build.Builder) void {
    const optimize = b.standardOptimizeOption(.{});
    inline for (@typeInfo(boards).Struct.decls) |decl| {
        if (!decl.is_pub)
            continue;

        const exe = microzig.addEmbeddedExecutable(b, .{
            .name = @field(boards, decl.name).name ++ ".minimal",
            .source_file = .{
                .path = "test/programs/minimal.zig",
            },
            .backing = .{ .board = @field(boards, decl.name) },
            .optimize = optimize,
        });
        exe.installArtifact(b);
    }

    inline for (@typeInfo(chips).Struct.decls) |decl| {
        if (!decl.is_pub)
            continue;

        const exe = microzig.addEmbeddedExecutable(b, .{
            .name = @field(chips, decl.name).name ++ ".minimal",
            .source_file = .{
                .path = "test/programs/minimal.zig",
            },
            .backing = .{ .chip = @field(chips, decl.name) },
            .optimize = optimize,
        });
        exe.installArtifact(b);
    }
    var exe = microzig.addEmbeddedExecutable(b, .{
        .name = "adafruit_itsybitsy_32u4",
        .source_file = .{ .path = "src/main.zig" },
        .backing = .{
            .board = itsybitsy,
        },
        .optimize = optimize,
    });
    exe.installArtifact(b);

    //    const bin = exe.inner.installed_path.? ++ exe.inner.out_filename;

    const upload = b.step("upload", "Upload the code via avrdude");
    const force_bootloader = b.addSystemCommand(&.{ "stty", "-F", "/dev/ttyACM0", "1200", "cs8", "-cstopb", "-parenb" });
    const avrwrite = b.addSystemCommand(&.{ "avrdude", "-p", "m32u4", "-c", "avr109", "-P", "/dev/ttyACM0", "-U", "flash:w:zig-out/bin/main.hex" });

    upload.dependOn(&force_bootloader.step);
    force_bootloader.step.dependOn(&avrwrite.step);
    avrwrite.step.dependOn(&exe.inner.step);
}
