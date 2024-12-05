extends Node


func _ready():
	var a: Array
	printt(len(a), a)

	a.resize(5)
	printt(len(a), a)

	a.append(5)
	printt(len(a), a)

	for i in range(5):
		a[i] = i

	printt(len(a), a)

	a.resize(2)
	printt(len(a), a)

	a.resize(5)
	printt(len(a), a)
