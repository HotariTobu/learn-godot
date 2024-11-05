extends Node

func _ready():
	var d = {}
	
	var k0 = Key.new(0)
	var k1 = Key.new(1)
	var ak0 = Key.new(0)
	
	d[k0] = 'k0'
	print(d)
	
	
	d[k0] = 're-k0'
	print(d)
	
	d[k1] = 'k1'
	print(d)
	
	d[ak0] = 'ak0'
	print(d)
	
class Key:
	var id: int
	
	func _init(_id: int):
		id = _id
