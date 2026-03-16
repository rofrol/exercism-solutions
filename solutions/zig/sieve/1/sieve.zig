const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var bitset = std.StaticBitSet(limit + 1).initFull();
    bitset.unset(0);
    bitset.unset(1);

    {
        var i: usize = 2;
        while (i <= limit) : (i += 1) {
            if (!bitset.isSet(i)) continue;
            var j = i * i;
            while (j <= limit) : (j += i) {
                bitset.unset(j);
            }
        }
    }

    var j: usize = 0;
    {
        var it = bitset.iterator(.{});
        while (it.next()) |i| {
            buffer[j] = @truncate(u32, i);
            j += 1;
        }
    }

    return buffer[0..j];
}
