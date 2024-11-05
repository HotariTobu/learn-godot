extends GridContainer

func _ready():
	breakpoint
	
	size.x *= 2
	breakpoint
	
	size.x = 400
	breakpoint
	
	await get_tree().process_frame
	breakpoint
