extends Node

@onready var player = $Player

var enemy_scene = preload("res://Scene/enemy.tscn")

var pop_line:Curve3D

func _init():
	pop_line = Curve3D.new()
	
	const size = 11
	
	pop_line.add_point(Vector3(size, 0, size).rotated(Vector3.UP, deg_to_rad(45)))
	pop_line.add_point(Vector3(-size, 0, size).rotated(Vector3.UP, deg_to_rad(45)))
	pop_line.add_point(Vector3(-size, 0, -size).rotated(Vector3.UP, deg_to_rad(45)))
	pop_line.add_point(Vector3(size, 0, -size).rotated(Vector3.UP, deg_to_rad(45)))
	pop_line.add_point(Vector3(size, 0, size).rotated(Vector3.UP, deg_to_rad(45)))

func pop_enemy(angle:float):
	var enemy = enemy_scene.instantiate()
	
	var pop_point = (Vector3.FORWARD * 15).rotated(Vector3.UP, angle)
	
	enemy.position = pop_line.get_closest_point(pop_point)
	
	enemy.position.y = 0.5
	
	enemy.player = player
	
	add_child(enemy)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(8):
		pop_enemy(deg_to_rad(i * 45))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	pop_enemy(randf_range(0.0, 2.0 * PI))
	
