extends GutTest

const MyClass = preload("res://Gut/cannot_stub_getter_funcs/my_class.gd")

var _my_class


func before_each():
	_my_class = double(MyClass, DOUBLE_STRATEGY.INCLUDE_NATIVE).new()
	stub(_my_class, "get_local_mouse_position").to_return(Vector2.ONE)


func test_process_passes():
	var pos = _my_class.get_local_mouse_position()
	assert_eq(pos, Vector2.ONE)


func test_process_fails():
	_my_class._process(1 / 30)
	var pos = _my_class.something_pos
	assert_eq(pos, Vector2.ONE)
