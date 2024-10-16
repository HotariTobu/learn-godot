extends Node

func _ready():
	child_to_parent()
	parent_to_child()
	
func child_to_parent():
	var child = Child.new()
	var parent = child as Parent
	print(parent)
	
func parent_to_child():
	var parent = Parent.new()
	var child = parent as Child
	print(child)
