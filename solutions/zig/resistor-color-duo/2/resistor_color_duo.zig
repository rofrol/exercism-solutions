pub const ColorBand = enum(isize) {
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
   return @enumToInt(colors[0]) * 10 + @enumToInt(colors[1]);
}