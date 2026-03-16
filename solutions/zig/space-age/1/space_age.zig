const year = 365.25 * 24 * 60 * 60;

pub const Planet = enum {
    earth,
    mercury,
    venus,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const e: f64 = @intToFloat(f64, seconds) / year;
        const result = switch (self) {
            .earth => e,
            .mercury => e / 0.2408467,
            .venus => e / 0.61519726,
            .mars => e / 1.8808158,
            .jupiter => e / 11.862615,
            .saturn => e / 29.447498,
            .uranus => e / 84.016846,
            .neptune => e / 164.79132,
        };
        @import("std").debug.print("\n{} {d:.2} {d:.2}\n", .{ seconds, e, result });
        return result;
    }
};
