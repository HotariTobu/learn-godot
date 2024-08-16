extends Node

const viewport_size = Vector2i(480, 720)
@export var mob_scene: PackedScene
var score


func _ready():
	get_viewport().size = viewport_size
	$Player.screen_size = viewport_size


func spawn_mob():
	var mob = mob_scene.instantiate() as RigidBody2D
	var location = $MobPath/MobSpawnLocation

	location.progress_ratio = randf()
	var position = (location as Node2D).position
	mob.position = position

	var direction = (location as Node2D).rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var speed = randf_range(150, 250)
	var velocity = Vector2.RIGHT.rotated(direction) * speed
	mob.linear_velocity = velocity

	add_child(mob)


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func game_over():
	$MobTimer.stop()
	$ScoreTimer.stop()

	$HUD.show_game_over()
	
	$Music.stop()
	$DeathSound.play()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	
	get_tree().call_group("mobs", "queue_free")
	
	$Music.play()
