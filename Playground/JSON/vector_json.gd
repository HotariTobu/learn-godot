extends Node

func _ready():
	var v = Vector2(5, 2)
	var s = str(v)
	var j = JSON.stringify(v)
	
	printt(v, s, j)
	printt(type_convert(s, TYPE_VECTOR2), JSON.parse_string(s), JSON.parse_string(j))
