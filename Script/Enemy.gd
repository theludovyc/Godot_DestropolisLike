extends CharacterBody3D

@export var player:Node3D

const SPEED = 2.0;

@onready var agent = $NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(player.position)
	pass

func _physics_process(delta):
	agent.target_position = player.position
	
	agent.velocity = (agent.get_next_path_position() - position).normalized() * SPEED

func _on_navigation_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()
