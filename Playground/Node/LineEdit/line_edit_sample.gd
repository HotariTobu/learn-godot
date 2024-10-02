extends Control


func _on_line_edit_text_changed(new_text):
	printt('New Text', new_text)


func _on_button_pressed():
	$LineEdit.text = $Button.text
