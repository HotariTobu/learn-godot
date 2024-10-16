extends Node

func _ready():
	var sprite = Sprite2D.new()
	sprite.centered = false
	sprite.texture = $SubViewport.get_texture()
	add_child(sprite)
