const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    var sum: u128 = 0;
    var n = num;
    var digits: usize = 0;
    while (n != 0) : (n /= 10) {
        digits += 1;
    }
    n = num;
    while (n != 0) : (n /= 10) {
        const i = n % 10;
        sum += std.math.pow(u128, i, digits);
    }
    return num == sum;
}
