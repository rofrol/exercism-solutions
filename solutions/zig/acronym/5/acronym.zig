const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    errdefer list.deinit();

    var shouldAppend = true;
    for (words) |c| {
        if (ascii.isSpace(c) or c == '-') {
            shouldAppend = true;
        } else if (shouldAppend and ascii.isAlphabetic(c)) {
            try list.append(ascii.toUpper(c));
            shouldAppend = false;
        }
    }
    return list.toOwnedSlice();
}
