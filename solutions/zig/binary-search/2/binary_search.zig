const std = @import("std");
const math = std.math;

/// Generic binary search that works for any comparable type `T`.
pub fn binarySearch(comptime T: type, key: T, items: []const T) ?usize {
    return binarySearchStd(T, key, items, {}, compare);
}

/// Comparator function used for all types.
fn compare(comptime T: type, context: void, key: T, mid_item: T) math.Order {
    _ = context;
    return math.order(key, mid_item);
}

/// Binary search implementation.
fn binarySearchStd(
    comptime T: type,
    key: T,
    items: []const T,
    context: anytype,
    comptime compareFn: fn (comptime T: type, context: @TypeOf(context), key: T, mid_item: T) math.Order,
) ?usize {
    var left: usize = 0;
    var right: usize = items.len;
    while (left < right) {
        const mid: usize = left + (right - left) / 2;
        switch (compareFn(T, context, key, items[mid])) {
            .eq => return mid,
            .gt => left = mid + 1,
            .lt => right = mid,
        }
    }
    return null;
}