extends Node

func _init():
	var i = 0
	
	var o = match i:
		0:
			4
		1:
			5
		_:
			2
			
	print(o)
