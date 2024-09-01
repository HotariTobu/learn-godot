extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var frames = $AnimatedSprite2D.sprite_frames as SpriteFrames
	var mob_types = frames.get_animation_names()
	var mob_type = mob_types[randi() % mob_types.size()]
	$AnimatedSprite2D.play(mob_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
