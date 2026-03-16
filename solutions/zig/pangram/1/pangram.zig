const std = @import("std");
const testing = std.testing;

pub fn isPangram(str: []const u8) bool {
    const allocator = testing.allocator;
    var map = std.AutoHashMap(u8, void).init(allocator);
    defer map.deinit();

    // change to for(97..123) for newer zig
    {
        var c: usize = 97;
        while (c < 123) : (c += 1) {
            map.put(std.ascii.toLower(@truncate(u8, c)), {}) catch unreachable;
        }
    }

    for (str) |c| {
        _ = map.remove(std.ascii.toLower(c));
        if (map.count() == 0) return true;
    }

    return map.count() == 0;
}
