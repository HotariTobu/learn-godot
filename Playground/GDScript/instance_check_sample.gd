extends Node

func _ready():
	var P: GDScript = Parent
	var C: GDScript = Child
	
	var p = P.new()
	var c = C.new()
	
	printt(p is Parent, c is Parent, p is Child, c is Child)
	printt(P.instance_has(p), P.instance_has(c), C.instance_has(p), C.instance_has(c))
