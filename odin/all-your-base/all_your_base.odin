package all_your_base

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
	Unimplemented,
}

rebase :: proc(
	input_base: int,
	digits: []int,
	output_base: int,
	allocator := context.allocator,
) -> (
	[]int,
	Error,
) {
	if input_base < 2 {return nil, .Input_Base_Too_Small}
	if output_base < 2 {return nil, .Output_Base_Too_Small}
	result := [dynamic]int
	for val in digits {
		// TODO: support hexadecimal a, b, c, d, e, f
		if val < 0 || val > input_base - 1 {
			return nil, .Invalid_Input_Digit
		}
		//append(&result, ;		
	}
	return nil, .Unimplemented
}

