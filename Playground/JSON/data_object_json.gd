extends Node


func _ready():
	var d = D.new()
	print(d)

	var j = JSON.stringify(d)
	print(j)

	var rd = JSON.parse_string(j)
	print(rd)


class D:
	var bool_var = true
	var int_var = 5
	var float_var = PI
	var str_var = "Hello"
	var str_name_var = &"World"
	var color_var = Color.DEEP_PINK

	var int_prop: int:
		get:
			return int_var * 2

	var float_prop: float:
		get:
			return float_var * 2
