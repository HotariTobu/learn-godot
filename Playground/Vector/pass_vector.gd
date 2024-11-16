extends Node


func _ready():
	var v = Vector2(5, 8)

	_p(v)

	v.x = -9

	_p(v)

	_c(v)

	_p(v)


func _p(v: Vector2):
	printt(v, v.x, v.y, v[&"x"], v[&"y"])


func _c(v: Vector2):
	v.y = 70
	_p(v)
