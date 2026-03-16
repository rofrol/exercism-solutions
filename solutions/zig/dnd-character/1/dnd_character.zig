const std = @import("std");

pub fn modifier(score: i8) i8 {
    return @divFloor(score - 10, 2);
}

pub fn ability() i8 {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        std.os.getrandom(std.mem.asBytes(&seed)) catch unreachable;
        break :blk seed;
    });
    const rand = prng.random();
    var arr = [_]i8{
        rand.intRangeAtMost(i8, 0, 5) + 1,
        rand.intRangeAtMost(i8, 0, 5) + 1,
        rand.intRangeAtMost(i8, 0, 5) + 1,
        rand.intRangeAtMost(i8, 0, 5) + 1,
    };
    std.sort.sort(i8, &arr, {}, comptime std.sort.desc(i8));

    return arr[0] + arr[1] + arr[2];
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const constitution = ability();
        return .{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = constitution,
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 10 + modifier(constitution),
        };
    }
};
