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

// Use fixed array indexed by enum
// https://exercism.org/tracks/odin/exercises/space-age/solutions/gspitz01
// https://odin-lang.org/docs/overview/#enumerated-array
ratios := [Planet]f64 {
	.Mercury = 0.2408467,
	.Venus   = 0.61519726,
	.Earth   = 1.0,
	.Mars    = 1.8808158,
	.Jupiter = 11.862615,
	.Saturn  = 29.447498,
	.Uranus  = 84.016846,
	.Neptune = 164.79132,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	years: f64 = f64(seconds) / 60 / 60 / 24 / 365.25
	return years / ratios[planet]
}

