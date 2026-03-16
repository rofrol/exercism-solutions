const std = @import("std");
const testing = std.testing;
const toLower = std.ascii.toLower;

pub fn isIsogram(str: []const u8) bool {
    const allocator = testing.allocator;
    var map = std.AutoHashMap(u8, u2).init(allocator);
    defer map.deinit();
    // change to for(97..123) for newer zig
    {
        var c: usize = 97;
        while (c < 123) : (c += 1) {
            map.put(toLower(@truncate(u8, c)), 0) catch unreachable;
        }
    }
    for (str) |c| {
        const key = toLower(c);
        if(map.get(key)) |val| {
            if(val == 1) return false;
            if(val == 0) map.put(key, 1) catch unreachable;
        }
    }
    return true;
}
