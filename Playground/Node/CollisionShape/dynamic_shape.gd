extends Node2D

var _is_on: bool

@onready var _segment_shape = $LineArea/CollisionShape2D.shape as SegmentShape2D
@onready var _pointer_area = $PointerArea


func _process(delta):
	_pointer_area.position = get_local_mouse_position()


func _draw():
	var from = _segment_shape.a
	var to = _segment_shape.b

	draw_line(from, to, Color.RED)

	if _is_on:
		draw_circle(_pointer_area.position, 10, Color.BLUE)


func _on_timer_timeout():
	_segment_shape.a.x = randx()
	_segment_shape.a.y = randy()
	_segment_shape.b.x = randx()
	_segment_shape.b.y = randy()
	queue_redraw()


func _on_pointer_area_area_entered(area):
	_is_on = true
	queue_redraw()


func _on_pointer_area_area_exited(area):
	_is_on = false
	queue_redraw()


func randx():
	return randf_range(100, 900)


func randy():
	return randf_range(100, 600)
