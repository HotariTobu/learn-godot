@tool

extends Node2D

const coords_head : Array = [
	[ 22.952, 83.271 ],  [ 28.385, 98.623 ],
	[ 53.168, 107.647 ], [ 72.998, 107.647 ],
	[ 99.546, 98.623 ],  [ 105.048, 83.271 ],
	[ 105.029, 55.237 ], [ 110.740, 47.082 ],
	[ 102.364, 36.104 ], [ 94.050, 40.940 ],
	[ 85.189, 34.445 ],  [ 85.963, 24.194 ],
	[ 73.507, 19.930 ],  [ 68.883, 28.936 ],
	[ 59.118, 28.936 ],  [ 54.494, 19.930 ],
	[ 42.039, 24.194 ],  [ 42.814, 34.445 ],
	[ 33.951, 40.940 ],  [ 25.637, 36.104 ],
	[ 17.262, 47.082 ],  [ 22.973, 55.237 ]
]

const coords_mouth = [
	[ 22.817, 81.100 ], [ 38.522, 82.740 ],
	[ 39.001, 90.887 ], [ 54.465, 92.204 ],
	[ 55.641, 84.260 ], [ 72.418, 84.177 ],
	[ 73.629, 92.158 ], [ 88.895, 90.923 ],
	[ 89.556, 82.673 ], [ 105.005, 81.100 ]
]

@export var max_mouth_width = 7

@export var font = ThemeDB.fallback_font

var _mouth_width = 4.4
var _time = 0

var head: PackedVector2Array
var mouth: PackedVector2Array

func float_array_to_Vector2Array(coords: Array):
	var array = PackedVector2Array()
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

func _ready():
	head = float_array_to_Vector2Array(coords_head)
	mouth = float_array_to_Vector2Array(coords_mouth)

func _process(delta):
	_time += delta
	_mouth_width = abs(sin(_time)) * max_mouth_width
	queue_redraw()

func _draw():
	var white = Color.WHITE
	var godot_blue = Color('478cbf')
	var grey = Color('414042')
	
	draw_polygon(head, [godot_blue])
	draw_polyline(mouth, white, _mouth_width)
	
	# eyes
	draw_circle(Vector2(42.479, 65.4825), 9.3905, white)
	draw_circle(Vector2(85.524, 65.4825), 9.3905, white)
	draw_circle(Vector2(43.423, 65.92), 6.246, grey)
	draw_circle(Vector2(84.626, 66.008), 6.246, grey)
	
	# nose
	draw_line(Vector2(64.273, 60.564), Vector2(64.273, 74.349), white, 5.8)

	draw_string(font, Vector2(20, 130), 'GODOT', HORIZONTAL_ALIGNMENT_CENTER, 90, 22)
