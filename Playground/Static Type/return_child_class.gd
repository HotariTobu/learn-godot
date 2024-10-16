extends Node

func _init():
	var holder = get_list_holder()
	print(holder.get_list())
	
	var holder_as_parent = get_list_holder() as Parent
	print(holder_as_parent.get_list())
	
func get_list_holder() -> Parent:
	return Child.new()
	
