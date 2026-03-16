const std = @import("std");
pub fn isValid(s: []const u8) bool {
    var i: usize = 0;
    var j: usize = s.len;
    var sum: u32 = 0;
    std.debug.print("\n", .{});
    while (j > 0) : (j -= 1) {
        const c = s[j - 1];
        if (std.ascii.isDigit(c)) {
            i += 1;
            sum += if (i % 2 == 0) blk: {
                var n = (c - '0') * 2;
                break :blk if (n > 9) n - 9 else n;
            } else c - '0';
        } else if (!std.ascii.isSpace(c)) {
            return false;
        }
        //std.debug.print("sum: {d}\n", .{sum});
    }
    return sum % 10 == 0 and i > 1;
}
