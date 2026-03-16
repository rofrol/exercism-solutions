pub fn squareOfSum(number: isize) isize {
    var sum: isize = 0;
    var n: isize = 1;
    // TODO: change to for(1..number + 1) on newer zig
    // https://kristoff.it/blog/zig-multi-sequence-for-loops/
    while(n <= number) {
        sum += n;
        n += 1;
    }
    return sum * sum;
    //@panic("compute the sum of i from 0 to n then square it");
}

pub fn sumOfSquares(number: isize) isize {
    var sum: isize = 0;
    var n: isize = 1;
    // TODO: change to for(1..number + 1) on newer zig
    // https://kristoff.it/blog/zig-multi-sequence-for-loops/
    while(n <= number) {
        sum += n * n;
        n += 1;
    }
    return sum;
    //@panic("compute the sum of i^2 from 0 to n");
}

pub fn differenceOfSquares(number: isize) isize {
    return squareOfSum(number) - sumOfSquares(number);
    //@panic("compute the difference between the square of sum and sum of squares");
}