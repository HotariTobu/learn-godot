@tool
extends Node

@export var number_count = 3:
	set(nc):
		number_count = nc
		numbers.resize(number_count)
		notify_property_list_changed()

var numbers = PackedInt32Array([0, 0, 0])

func _get_property_list():
	var properties = [
		#{
			#"name": "numbers",
			#"type": TYPE_PACKED_INT32_ARRAY,
		#}
	]

	for i in range(number_count):
		properties.append({
			"name": "number_%d" % i,
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": "ZERO,ONE,TWO,THREE,FOUR,FIVE",
		})

	return properties

func _get(property):
	if property.begins_with("number_"):
		var index = property.get_slice("_", 1).to_int()
		return numbers[index]

func _set(property, value):
	if property.begins_with("number_"):
		var index = property.get_slice("_", 1).to_int()
		numbers[index] = value
		return true
	return false





func _ready():
	print(self.number_1)
	self.number_1 = 3
	print(self.number_1)
	
	print('number_1' in self)
	print('numbers' in self)
	print('number' in self)
	
	print(numbers)
	print(self.numbers)
	print(get('numbers'))
	
	# Invalid access of index '10' on a base object of type: 'PackedInt32Array'.
	#print(self.number_10)
	
	#Invalid access to property or key 'number' on a base object of type 'Node (custom_property.gd)'.
	#print(self.number)
