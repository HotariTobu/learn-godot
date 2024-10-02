extends Node

const PlainIconScene = preload("res://Manual/File and data IO/Saving games/JSON serialization/icon.tscn")

const IconScene = preload("res://Manual/File and data IO/Saving games/Binary serialization/icon.tscn")
const Icon = preload("res://Manual/File and data IO/Saving games/Binary serialization/icon.gd")


func _ready():
	var data = _serialize()
	print(data)
	_deserialize(data)


func _serialize():
	var plain_icon = PlainIconScene.instantiate()
	$Frame/Src.add_child(plain_icon)
	
	var icon = IconScene.instantiate()
	$Frame/Src.add_child(icon)
	
	var dict = {
		"plain_icon": {	
			"texture_path": (plain_icon.texture as CompressedTexture2D).load_path,
			"transform": plain_icon.transform,
		},
		"icon": icon,
	}

	var data = var_to_bytes(dict)
	
	#var data = var_to_str(plain_icon)
	#var data = var_to_bytes_with_objects(plain_icon)
	return data


func _deserialize(data):
	var plain_icon = Sprite2D.new()
	#var plain_icon = str_to_var(data)
	#var plain_icon = bytes_to_var_with_objects(data)
	$Frame/Dst.add_child(plain_icon)
	
	var dict = bytes_to_var(data)

	var texture = CompressedTexture2D.new()
	texture.load_path = dict['plain_icon']["texture_path"]
	plain_icon.texture = texture

	plain_icon.transform = dict['plain_icon']["transform"]



	var icon = Icon.new()
	$Frame/Dst.add_child(icon)
	
	icon.restore(dict['icon'])
