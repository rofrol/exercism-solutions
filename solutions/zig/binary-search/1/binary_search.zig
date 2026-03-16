const std = @import("std");
const math = std.math;

pub fn binarySearch(comptime T: type, key: anytype, items: []const T) ?usize {
    return switch (T) {
        i4 => binarySearchStd(i4, @as(i4, key), items, {}, S.order_i4),
        u4 => binarySearchStd(u4, @as(u4, key), items, {}, S.order_u4),
        i8 => binarySearchStd(i8, @as(i8, key), items, {}, S.order_i8),
        u8 => binarySearchStd(u8, @as(u8, key), items, {}, S.order_u8),
        i16 => binarySearchStd(i16, @as(i16, key), items, {}, S.order_i16),
        u16 => binarySearchStd(u16, @as(u16, key), items, {}, S.order_u16),
        i32 => binarySearchStd(i32, @as(i32, key), items, {}, S.order_i32),
        u32 => binarySearchStd(u32, @as(u32, key), items, {}, S.order_u32),
        i64 => binarySearchStd(i64, @as(i64, key), items, {}, S.order_i64),
        u64 => binarySearchStd(u64, @as(u64, key), items, {}, S.order_u64),
        isize => binarySearchStd(isize, @as(isize, key), items, {}, S.order_isize),
        else => unreachable,
    };
}

fn binarySearchStd(
    comptime T: type,
    key: anytype,
    items: []const T,
    context: anytype,
    comptime compareFn: fn (context: @TypeOf(context), key: @TypeOf(key), mid_item: T) math.Order,
) ?usize {
    var left: usize = 0;
    var right: usize = items.len;
    while (left < right) {
        const mid: usize = left + (right - left) / 2;
        switch (compareFn(context, key, items[mid])) {
            .eq => return mid,
            .gt => left = mid + 1,
            .lt => right = mid,
        }
    }
    return null;
}

const S = struct {
    fn order_i4(context: void, key: i4, mid_item: i4) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_u4(context: void, key: u4, mid_item: u4) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_i8(context: void, key: i8, mid_item: i8) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_u8(context: void, key: u8, mid_item: u8) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_i16(context: void, key: i16, mid_item: i16) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_u16(context: void, key: u16, mid_item: u16) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_i32(context: void, key: i32, mid_item: i32) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_u32(context: void, key: u32, mid_item: u32) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_i64(context: void, key: i64, mid_item: i64) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_u64(context: void, key: u64, mid_item: u64) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
    fn order_isize(context: void, key: isize, mid_item: isize) math.Order {
        _ = context;
        return math.order(key, mid_item);
    }
};
