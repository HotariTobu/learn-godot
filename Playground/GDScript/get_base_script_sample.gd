extends Node

func _ready():
	print(get_script())
	print(get_script().get_base_script())
	#Attempt to call function 'get_base_script' in base 'null instance' on a null instance.
	#print(get_script().get_base_script().get_base_script())
	
	var C: GDScript = Child
	print(Child)
	print(C)
	print(C.get_base_script())
	print(C.get_base_script().get_base_script())
	
