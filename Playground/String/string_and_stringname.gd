extends Node

func _init():
	var st: String = 'Hello'
	var stna: StringName = 'Hello'
	
	assert(st == stna)
	
	assert(st is String)
	assert(stna is String)
	
	assert(st is StringName)
	assert(stna is StringName)
