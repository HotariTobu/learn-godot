extends Node2D

@export var color = Color.GREEN
@export var width = 10

var _is_dragging = false

var _start_point = Vector2.ZERO
var _end_point = Vector2.ZERO


func _process(delta):
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_is_dragging = false
		return

	#var mouse_pos = get_viewport().get_mouse_position()
	var mouse_pos = get_local_mouse_position()
	#var mouse_pos = get_global_mouse_position()

	if not _is_dragging:
		_start_point = mouse_pos
		_is_dragging = true

	_end_point = mouse_pos
	queue_redraw()


func _draw():
	draw_line(_start_point, _end_point, color, width)
