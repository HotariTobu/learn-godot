extends Node2D


@onready var _child = $Child

func _on_child_visibility_changed():
	if not is_instance_valid(_child):
		return
		
	printt(visible, is_visible_in_tree(), _child.visible, _child.is_visible_in_tree())
	
