const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    var wasSpace = true;
    for (words) |c| {
        if (wasSpace and std.ascii.isAlphabetic(c)) {
            try list.append(std.ascii.toUpper(c));
            wasSpace = false;
        }
        if (c == ' ' or c == '-') wasSpace = true;
    }
    return list.toOwnedSlice();
}
