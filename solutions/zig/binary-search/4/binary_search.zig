const std = @import("std");
/// Public binary search function
pub fn binarySearch(comptime T: type, key: T, items: []const T) ?usize {
    const Comparator = struct {
        fn compare(context: T, item: T) std.math.Order {
            return std.math.order(context, item);
        }
    };
    return binarySearchStd(T, items, key, Comparator.compare);
}
/// Generic binary search implementation
fn binarySearchStd(
    comptime T: type,
    items: []const T,
    context: anytype,
    comptime compareFn: fn (@TypeOf(context), T) std.math.Order,
) ?usize {
    var low: usize = 0;
    var high: usize = items.len;

    while (low < high) {
        // Avoid overflowing in the midpoint calculation
        const mid = low + (high - low) / 2;
        switch (compareFn(context, items[mid])) {
            .eq => return mid,
            .gt => low = mid + 1,
            .lt => high = mid,
        }
    }
    return null;
}
