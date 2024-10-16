extends ColorPicker

func _ready():
	var line_edits = find_children('', 'LineEdit', true, false)
	line_edits[-1].grab_focus()
