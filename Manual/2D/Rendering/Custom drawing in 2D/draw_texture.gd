extends Node2D

@export var texture: Texture2D:
	set(value):
		texture = value
		# Hove to request re-drawing because the draw commands are cached.
		queue_redraw()


func _draw():
	draw_texture(texture, Vector2.ZERO)
