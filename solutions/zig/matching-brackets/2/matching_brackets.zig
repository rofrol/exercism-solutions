const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var list = std.ArrayList(u8).init(allocator);
    defer list.deinit();
    for (s) |c| {
        if (!(c == '(' or c == ')' or c == '[' or c == ']' or c == '{' or c == '}')) continue;
        if (list.items.len == 0) {
            try list.append(c);
            continue;
        }

        // TODO: Use below in zig 0.11
        //if (list.getLastOrNull()) |last| {
        if (list.popOrNull()) |last| {
            if (!(c == ')' and last == '(' or
                c == ']' and last == '[' or
                c == '}' and last == '{'))
            {
                try list.append(last);
                try list.append(c);
            }
        }
    }
    return list.items.len == 0;
}
