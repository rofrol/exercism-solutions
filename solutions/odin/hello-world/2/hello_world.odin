package hello_world

hello_world :: proc() -> string {
	return "Hello, World!"
}

main :: proc() {
	hello_world()
}

