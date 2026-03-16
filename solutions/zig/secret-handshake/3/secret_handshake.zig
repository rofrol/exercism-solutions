const std = @import("std");
const mem = std.mem;
// const print = std.debug.print;

pub const Signal = enum {
    wink,
    double_blink,
    close_your_eyes,
    jump,
    reverse,
};

pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![]const Signal {
    var list = std.ArrayList(Signal).init(allocator);
    errdefer list.deinit();
    var n = number;
    // print("\n", .{});
    {
        var i: usize = 0;
        while (n > 0) : ({
            n >>= 1;
            i += 1;
        }) {
            // print("n: {b}\n", .{n});
            if (n & 1 != 0) {
                try list.append(@intToEnum(Signal, i));
            }
        }
    }
    if (list.items.len != 0 and list.items[list.items.len - 1] == .reverse) {
        // print("last: {}\n", .{list.items[list.items.len - 1]});
        _ = list.pop();
        mem.reverse(Signal, list.items);
        // var i: usize = 0;
        // while (i < list.items.len / 2) : (i += 1) {
        //     var tmp = list.items[i];
        //     list.items[i] = list.items[list.items.len - i - 1];
        //     list.items[list.items.len - i - 1] = tmp;
        // }
    }
    return list.toOwnedSlice();
}
