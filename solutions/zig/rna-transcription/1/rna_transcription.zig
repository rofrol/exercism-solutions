const std = @import("std");
const mem = std.mem;

const RnaError = error{};
pub fn toRna(allocator: mem.Allocator, dna: []const u8) (RnaError || mem.Allocator.Error)![]const u8 {
    var buf = try allocator.alloc(u8, dna.len);
    for (dna) |c, i| {
        std.debug.print("{} {}\n", .{ c, i });
        buf[i] = switch (c) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => unreachable,
        };
    }
    return buf;
}
