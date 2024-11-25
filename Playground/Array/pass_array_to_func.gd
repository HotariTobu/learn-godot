extends Node


func _ready():
	var a = []

	print(a)

	f(a)

	print(a)


func f(a: Array):
	a.append(5)
