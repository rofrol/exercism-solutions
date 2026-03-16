const std = @import("std");
const EnumSet = std.EnumSet;
// const print = std.debug.print;
const IntegerBitSet = std.bit_set.IntegerBitSet;

pub const Allergen = enum(u9) {
    // eggs,
    // peanuts,
    // shellfish,
    // strawberries,
    // tomatoes,
    // chocolate,
    // pollen,
    // cats,
    eggs = 1,
    peanuts = 2,
    shellfish = 4,
    strawberries = 8,
    tomatoes = 16,
    chocolate = 32,
    pollen = 64,
    cats = 128,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    // const single = EnumSet(Allergen).initMany(&[_]Allergen{allergen});
    // const all = initAllergenSet(score);
    //
    // return single.subsetOf(all);
    return score & @enumToInt(allergen) != 0;
}

const tag_type = @typeInfo(Allergen).Enum.tag_type;

// pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
pub fn initAllergenSet(score: tag_type) EnumSet(Allergen) {
    // TODO: use this when zig 0.11 is supported

    // const all = EnumSet(Allergen).initEmpty();
    // var all = EnumSet(Allergen).init();
    // var n = score;
    // var i: usize = 0;
    // while (n > 0) : ({
    //     n >>= 1;
    //     i += 1;
    // }) {
    //     if (n & 1 == 1) {
    //         const en = @intToEnum(Allergen, i);
    //         // print("en: {}\n", .{en});
    //
    //         all.insert(en);
    //     }
    // }
    // return all;

    const len = @typeInfo(Allergen).Enum.fields.len;
    const bits = IntegerBitSet(len){ .mask = @truncate(u8, score) };
    return .{ .bits = bits };
}
