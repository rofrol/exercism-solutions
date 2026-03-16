pub fn steps(number: isize) anyerror!usize {
    if(number < 1) return ComputationError.IllegalArgument;
    var s: usize = 0;
    var n = number;
    while(n != 1) : (s += 1) {
         if(@mod(n, 2) == 0) n = @divTrunc(n, 2) else n = n * 3 + 1;
    }
    return s;
}

pub const ComputationError = error{
    IllegalArgument,
};