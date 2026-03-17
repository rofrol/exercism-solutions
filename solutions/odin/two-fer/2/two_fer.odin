package two_fer
import "core:fmt"

two_fer :: proc(name: string = "you") -> string {
	return fmt.tprintf("One for %v, one for me.", name)
}

