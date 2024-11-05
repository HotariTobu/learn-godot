extends Node

func _ready():
	var dict = {
		'value': 5
	}

	# Invalid access to property or key 'get_property_list' on a base object of type 'Dictionary'.
	# print(dict.get_property_list)
	# print(dict.property_can_revert)
	# print(dict.property_get_revert)
