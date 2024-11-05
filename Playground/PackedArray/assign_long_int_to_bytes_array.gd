extends Node

const I1 = 0x4f5c
const I2 = 0xb731

func _ready():
	var bytes = PackedByteArray()
	bytes.resize(16)
	
	bytes[0] = I1
	bytes[15] = I2
	
	print(bytes)
	printt(I1 >> 24, I1 >> 16, I1 >> 8, I1 >> 0)
	printt(I2 >> 24, I2 >> 16, I2 >> 8, I2 >> 0)
