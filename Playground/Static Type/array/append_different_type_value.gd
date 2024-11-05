extends Node

var array: Array[String] = []

func _ready():
	array.append('Test')
	print(array)
	
	array += ['Hi', 'Hello']
	print(array)
	
	#Attempted to push_back a variable of type 'int' into a TypedArray of type 'String'.
	array.append(5)
	print(array)
	
	#Cannot include a value of type "int" as "String".
	#array += [1, 7]
	#print(array)
