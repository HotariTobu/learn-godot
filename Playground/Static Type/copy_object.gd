extends Node

func _ready():
	var parent0 = Parent.new()
	var parent1 = parent0.copy()
	
	print(parent0 == parent0)
	print(parent0 == parent1)
	print(parent1 == parent1)
	
	var child0 = Child.new()
	var child1 = child0.copy()
	
	print(child0 == child0)
	print(child0 == child1)
	print(child1 == child1)
	
	print(child1 as Child)
