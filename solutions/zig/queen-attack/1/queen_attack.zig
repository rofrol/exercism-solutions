const std = @import("std");
pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    row: i8,
    col: i8,
    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row < 0 or row > 7 or col < 0 or col > 7)
            return QueenError.InitializationFailure;
        return @This(){ .row = row, .col = col };
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        const rdiff = std.math.absInt(self.row - other.row) catch unreachable;
        const cdiff = std.math.absInt(self.col - other.col) catch unreachable;
        return self.row == other.row or self.col == other.col or rdiff == cdiff;
    }
};
