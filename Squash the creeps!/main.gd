extends Node

@export var mob_scene: PackedScene


func _ready():
	$UserInterface/Retry.hide()


func _unhandled_input(event):
	if $UserInterface/Retry.visible and event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.progress_ratio = randf()
	var mob_position = (mob_spawn_location as Node3D).position

	var player_position = $Player.position
	mob.initialize(mob_position, player_position)

	add_child(mob)

	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())


func _on_player_hit():
	$MobTimer.stop()
	$UserInterface/Retry.show()
