extends Area3D
class_name Bullet

const SPEED = 20

func _physics_process(delta):
	position += (transform.basis * Vector3.FORWARD).normalized() * SPEED * delta
	
func _process(delta):
	if position.distance_to(Vector3.ZERO) > 20:
		queue_free()
