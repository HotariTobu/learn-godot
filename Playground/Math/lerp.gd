extends Node

var _from: float = 0
var _to: float = TAU
var _weight: float = 0

func _on_from_box_value_changed(value):
	_from = value * PI
	_update_hands()


func _on_to_box_value_changed(value):
	_to = value * PI
	_update_hands()


func _on_h_slider_value_changed(value):
	_weight = value
	_update_hands()


func _update_hands():
	$Hand1.rotation = lerpf(_from, _to, _weight)
	$Hand2.rotation = lerp_angle(_from, _to, _weight)
	printt($Hand1.rotation, $Hand2.rotation)
