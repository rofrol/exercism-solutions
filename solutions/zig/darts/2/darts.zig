pub const Coordinate = struct {
    x: f32,
    y: f32,
    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return @This(){ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const s = @sqrt(self.x * self.x + self.y * self.y);
        return if (s <= 1) 10 else if (s <= 5) 5 else if (s <= 10) 1 else 0;
    }
};
