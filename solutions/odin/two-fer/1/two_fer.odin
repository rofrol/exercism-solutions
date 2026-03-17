package two_fer
import "core:fmt"

two_fer :: proc(name: string = "") -> string {
	return fmt.tprintf("One for %v, one for me.", name if name != "" else "you")
}

