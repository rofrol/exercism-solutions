package hello_world

hello_world :: proc() -> string {
	return "Goodbye, World!"
}

main :: proc() {
	hello_world()
}

