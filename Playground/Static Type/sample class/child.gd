class_name Child
extends Parent

var child_var: int = 0

static var child_static_var: float = PI


func child_func():
	pass


func get_list():
	var list = super()
	list.append("Hi")
	return list
