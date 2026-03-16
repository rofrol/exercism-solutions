const std = @import("std");
const math = std.math;

/// Public binary search function
pub fn binarySearch(comptime T: type, key: T, items: []const T) ?usize {
    const Comparator = struct {
        fn compare(_: void, a: T, b: T) math.Order {
            return math.order(a, b);
        }
    };
    return binarySearchStd(T, key, items, {}, Comparator.compare);
}

/// Generic binary search implementation
fn binarySearchStd(
    comptime T: type,
    key: T,
    items: []const T,
    context: anytype,
    comptime compareFn: fn (void, T, T) math.Order,
) ?usize {
    var left: usize = 0;
    var right: usize = items.len;
    while (left < right) {
        const mid = left + (right - left) / 2;
        switch (compareFn(context, key, items[mid])) {
            .eq => return mid,
            .gt => left = mid + 1,
            .lt => right = mid,
        }
    }
    return null;
}