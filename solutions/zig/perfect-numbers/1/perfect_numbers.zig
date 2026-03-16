pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: usize) Classification {
    if (n == 1) return Classification.deficient;
    var sum: usize = 1;
    var i: usize = 2;
    while (i < n - 1) : (i += 1) {
        if (n % i == 0) {
            sum += i;
        }
    }
    if (sum == n) {
        return Classification.perfect;
    } else if (sum < n) {
        return Classification.deficient;
    } else {
        return Classification.abundant;
    }
}
