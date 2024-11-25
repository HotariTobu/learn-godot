extends Node

func _ready():
	var a: Array
	
	printt(len(a), a)
	
	a.resize(5)
	
	printt(len(a), a)
	
	a.append(5)
	
	printt(len(a), a)
