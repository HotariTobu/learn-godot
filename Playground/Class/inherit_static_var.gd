extends Node

func _ready():
	print(P.a)
	print(C.a)
	
	var p = P.new()
	var c = C.new()
	
	print(p.a)
	print(c.a)
	
	P.a.append(5)
	
	print(P.a)
	print(C.a)
	print(p.a)
	print(c.a)
	
class P:
	static var a = []
	
class C:
	extends P
