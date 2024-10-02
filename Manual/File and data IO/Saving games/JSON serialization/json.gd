extends Node

const IconScene = preload("res://Manual/File and data IO/Saving games/JSON serialization/icon.tscn")


func _ready():
	var data = _serialize()
	print(data)
	_deserialize(data)


func _serialize():
	var icon = IconScene.instantiate()
	$Frame/Src.add_child(icon)

	var dict = {
		#"texture": icon.texture,
		"texture_path": (icon.texture as CompressedTexture2D).load_path,
		#"transform": icon.transform,
		"pos_x": icon.position.x,
		"pos_y": icon.position.y,
	}

	var data = JSON.stringify(dict)
	return data


func _deserialize(data):
	var icon = Sprite2D.new()
	$Frame/Dst.add_child(icon)

	var dict = JSON.parse_string(data)

	#icon.texture = dict["texture"]
	var texture = CompressedTexture2D.new()
	texture.load_path = dict["texture_path"]
	icon.texture = texture

	#icon.transform = dict["transform"]
	var position = Vector2()
	position.x = dict["pos_x"]
	position.y = dict["pos_y"]
	icon.position = position
