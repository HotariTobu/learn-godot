extends Path2D

func _draw():
	var points = curve.get_baked_points()
	draw_polyline(points, Color.RED)

func to_dict():
	var points = []
	points.resize(curve.point_count)
	
	for index in range(len(points)):
		var point = curve.get_point_position(index)
		points[index] = point
		
	return {
		'points': points
	}
	
	#return {
		#'curve': curve
	#}
	
func from_dict(dict):
	curve = Curve2D.new()
	var points = dict['points']
	
	for point in points:
		curve.add_point(point)
		
	#curve = dict['curve']
