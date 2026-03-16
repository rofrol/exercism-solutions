const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    var wasSpace = true;
    for (words) |c| {
        if (wasSpace and ascii.isAlphabetic(c)) {
            try list.append(ascii.toUpper(c));
            wasSpace = false;
        }
        if (ascii.isSpace(c) or c == '-') wasSpace = true;
    }
    return list.toOwnedSlice();
}
