extends Node

func _ready():
	pass
	
func do_somthing(str: String):
	printt('str', str)
	
# Function "do_somthing" has the same name as a previously declared function.
func do_somthing(num: int):
	printt('num', num)
