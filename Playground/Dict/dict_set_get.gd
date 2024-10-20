extends Node

func _ready():
	var dict = {
		'value': 5
	}

	print(dict.value)
	print(dict['value'])
	print(dict.get('value'))

	dict.value = 10

	print(dict.value)
	print(dict['value'])
	print(dict.get('value'))

	dict['value'] = 10

	print(dict.value)
	print(dict['value'])
	print(dict.get('value'))

	# Invalid call. Nonexistent function 'set' in base 'Dictionary'.
	# dict.set('value', 15)

	# print(dict.value)
	# print(dict['value'])
	# print(dict.get('value'))

	print('### Data ###')

	var data = Data.new()

	print(data.value)
	print(data['value'])
	print(data.get('value'))

	data.value = 10

	print(data.value)
	print(data['value'])
	print(data.get('value'))

	data['value'] = 10

	print(data.value)
	print(data['value'])
	print(data.get('value'))

	data.set('value', 15)

	print(data.value)
	print(data['value'])
	print(data.get('value'))

class Data:
	var value: int = 5
