extends Node

var _events: Array[InputEvent]:
	get:
		var events: Array[InputEvent] = []
		
		var accept_press = InputEventAction.new()
		accept_press.action = 'ui_accept'
		accept_press.pressed = true
		events.append(accept_press)
		
		var accept_release = InputEventAction.new()
		accept_release.action = 'ui_accept'
		accept_release.pressed = false
		events.append(accept_release)
		
		var click_press = InputEventMouseButton.new()
		click_press.button_index = MOUSE_BUTTON_LEFT
		click_press.pressed = true
		events.append(click_press)
		
		var click_release = InputEventMouseButton.new()
		click_release.button_index = MOUSE_BUTTON_LEFT
		click_release.pressed = false
		events.append(click_release)
		
		var space_press = InputEventKey.new()
		space_press.keycode = KEY_SPACE
		space_press.pressed = true
		events.append(space_press)
		
		var space_release = InputEventKey.new()
		space_release.keycode = KEY_SPACE
		space_release.pressed = false
		events.append(space_release)
		
		return events

func _input(event):
	printt(event)

func _on_timer_timeout():
	for event in _events:
		Input.parse_input_event(event)
