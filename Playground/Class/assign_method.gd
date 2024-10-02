extends Node

func _init():
	var my_class = MyClass.new()
	
	print(my_class.foo(5))
	
	my_class.foo = print
	
	my_class.foo(5)
	
class MyClass:
	func foo(num: int):
		return num * 2
