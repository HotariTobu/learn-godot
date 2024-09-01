extends Node2D

@export_range(1, 1000) var segments = 100
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
	var center = (_start_point + _end_point) / 2
	var radius = _start_point.distance_to(_end_point) / 2
	var start_angle = _start_point.angle_to_point(_end_point)
	var end_angle = start_angle + PI
	draw_arc(center, radius, start_angle, end_angle, segments, color, width)

	printt(center, radius, rad_to_deg(start_angle), rad_to_deg(end_angle))
