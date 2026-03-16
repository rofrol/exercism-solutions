const std = @import("std");
const powi = std.math.powi;
pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: isize) anyerror!u64 {
    if(index < 1 or index > 64 ) return ChessboardError.IndexOutOfBounds;
    const p = try powi(u64, 2, @intCast(u64, index - 1));
    return p;
}

pub fn total() u64 {
    var sum: u64 = 0;
    var i: usize = 0;
    while(i < 64) : (i += 1) {
        const p = powi(u64, 2, i) catch unreachable;
        sum += p;
    }
    return sum;
}
