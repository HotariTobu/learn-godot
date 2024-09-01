extends CharacterBody3D

signal hit

@export var speed = 14
@export var fall_acceleration = 75
@export var jump_inpulse = 20
@export var bounce_inpulse = 16

var target_velocity = Vector3.ZERO


func _process(_delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_dir:
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1


func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_dir:
		input_dir = input_dir.normalized()
		var direction = Vector3(input_dir.x, 0, input_dir.y)
		$Pivot.basis = Basis.looking_at(direction)

		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed
	else:
		target_velocity.x = 0
		target_velocity.z = 0

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			target_velocity.y = jump_inpulse
	else:
		target_velocity.y -= fall_acceleration * delta

	velocity = target_velocity
	move_and_slide()

	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)

		var collider = collision.get_collider() as Node
		if collider == null:
			continue

		if not collider.is_in_group("mobs"):
			continue

		if Vector3.UP.dot(collision.get_normal()) < 0.1:
			continue

		var mob = collider
		mob.squash()

		target_velocity.y = bounce_inpulse

		break

	$Pivot.rotation.x = PI / 6 * velocity.y / jump_inpulse


func _on_mob_detector_body_entered(body):
	die()


func die():
	hit.emit()
	queue_free()
