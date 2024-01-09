extends CharacterBody3D

@export var camera:Camera3D

var bullet_scene = preload("res://Scene/bullet.tscn")

const SPEED = 8.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	look_at(camera.mousePos3D)
	
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		var bullet = bullet_scene.instantiate()
		
		bullet.position = position
		bullet.rotation = rotation
		
		get_parent().add_child(bullet)
	pass
