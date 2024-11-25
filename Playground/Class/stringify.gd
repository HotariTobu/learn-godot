extends Node

var _d = D.new()

func _ready():
	_d.v = -5
	
	var d = D.new()
	d.v = 5
	
	printt(_d, d)
	breakpoint

class D:
	var v: int
	
	func _to_string():
		return "D(%s)" % v
