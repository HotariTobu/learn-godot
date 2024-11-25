extends Node


func _ready():
	var d = {}

	print(d)

	f(d)

	print(d)


func f(d: Dictionary):
	d["hoge"] = "fuga"
