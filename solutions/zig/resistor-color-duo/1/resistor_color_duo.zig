pub const ColorBand = enum {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

pub fn colorCode(colors: []const ColorBand) anyerror!isize {
   return @as(isize, @enumToInt(colors[0])) * 10 + @enumToInt(colors[1]);
}