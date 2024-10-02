extends GutTest

const MyClass = preload("res://Gut/native_method_infinite_loop/my_class.gd")

var _my_class


func before_each():
	_my_class = double(MyClass, DOUBLE_STRATEGY.INCLUDE_NATIVE).new()
	stub(_my_class, "get_index").param_defaults([false])


func test_process_passes():
	_my_class.get_index()
	assert_called(_my_class, "get_index")


func test_process_fails():
	_my_class._process(1 / 30)
	assert_called(_my_class, "get_index")
