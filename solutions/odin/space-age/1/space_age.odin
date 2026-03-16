package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}


age :: proc(planet: Planet, seconds: int) -> f64 {
	years: f64 = f64(seconds) / 60 / 60 / 24 / 365.25
	ratios := make(map[Planet]f64)
	defer delete(ratios)

	ratios[.Mercury] = 0.2408467
	ratios[.Venus] = 0.61519726
	ratios[.Earth] = 1.0
	ratios[.Mars] = 1.8808158
	ratios[.Jupiter] = 11.862615
	ratios[.Saturn] = 29.447498
	ratios[.Uranus] = 84.016846
	ratios[.Neptune] = 164.79132
	return years / ratios[planet]
}

