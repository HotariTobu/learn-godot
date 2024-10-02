extends Node

const PathScene = preload('res://Manual/File and data IO/Saving games/Binary serialization/path.tscn')
const Path = preload('res://Manual/File and data IO/Saving games/Binary serialization/path.gd')

func _ready():
	var data = _serialize()
	print(data)
	_deserialize(data)


func _serialize():
	var path = PathScene.instantiate()
	$Frame/Src.add_child(path)

	var dict = path.to_dict()
	var data = var_to_bytes(dict)
	return data


func _deserialize(data):
	var path = Path.new()

	var dict = bytes_to_var(data)
	path.from_dict(dict)
	
	$Frame/Dst.add_child(path)
