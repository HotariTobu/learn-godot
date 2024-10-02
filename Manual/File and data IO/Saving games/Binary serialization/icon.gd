extends Sprite2D

func restore(data):
	print(data.get_property_list())
	#self.texture_path = data.texture_path
	#self.transform = data.transform

func _get_property_list():
	return [
		{
			'name': 'texture_path',
			'type': TYPE_STRING,
			'usage': PROPERTY_USAGE_STORAGE,
		},
		{
			'name': 'transform',
			'usage': PROPERTY_USAGE_STORAGE,
		},
	]

func _get(property):
	if property == 'texture_path':
		return (texture as CompressedTexture2D).load_path

func _set(property, value):
	if property == 'texture_path':
		texture = CompressedTexture2D.new()
		texture.load_path = value
