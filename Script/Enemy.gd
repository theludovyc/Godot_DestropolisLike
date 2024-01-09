extends CharacterBody3D

@export var player:Node3D

const SPEED = 2.0;

@onready var agent = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(Vector3(player.position.x, position.y, player.position.z))
	pass

func _physics_process(delta):
	agent.target_position = player.position
	
	agent.velocity = (agent.get_next_path_position() - position).normalized() * SPEED

func _on_navigation_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()


func _on_area_3d_area_entered(area):
	if area is Bullet:
		area.queue_free()
		queue_free()
