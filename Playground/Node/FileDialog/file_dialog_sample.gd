extends Node


func _on_scene_tree_button_pressed():
	$FileDialog.show()
	var result = await $FileDialog.close_requested
	#var result = await $FileDialog.file_selected
	printt(result, $FileDialog.current_dir, $FileDialog.current_file, $FileDialog.current_path)


func _on_code_button_pressed():
	var dialog = FileDialog.new()
	dialog.show()
