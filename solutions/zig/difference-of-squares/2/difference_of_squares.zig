pub fn squareOfSum(number: isize) isize {
    var sum: isize = 0;
    // TODO: change to for(1..number + 1) on newer zig
    // https://kristoff.it/blog/zig-multi-sequence-for-loops/
    {
        var n: isize = 1;
        while(n <= number) : (n += 1) {
            sum += n;
        }
    }
    return sum * sum;
    //@panic("compute the sum of i from 0 to n then square it");
}

pub fn sumOfSquares(number: isize) isize {
    var sum: isize = 0;
    // TODO: change to for(1..number + 1) on newer zig
    // https://kristoff.it/blog/zig-multi-sequence-for-loops/
    {
        var n: isize = 1;
        while(n <= number) : (n += 1) {
            sum += n * n;
        }
    }
    return sum;
    //@panic("compute the sum of i^2 from 0 to n");
}

pub fn differenceOfSquares(number: isize) isize {
    return squareOfSum(number) - sumOfSquares(number);
    //@panic("compute the difference between the square of sum and sum of squares");
}