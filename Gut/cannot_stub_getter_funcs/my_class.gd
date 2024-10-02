extends Node2D

var something_pos: Vector2


func _process(_delta):
	something_pos = get_local_mouse_position()
