extends GutTest

const MyClass = preload("res://Gut/signal_connected_funcs_not_called/my_class.gd")

func test_something_occurred():
	var my_class = MyClass.new()
	#var my_class = double(MyClass).new()
	watch_signals(my_class)
	
	my_class.something_occurred.connect(func():
		gut.p('Something occurred!')
		)
	my_class.do_something()
	
	assert_signal_emitted(my_class, 'something_occurred')
	
	my_class.free()
