class_name Child
extends Parent

var child_var: int = 0

func child_func():
	pass

func get_list():
	var list = super()
	list.append('Hi')
	return list
