extends Camera3D


var mousePos3D:Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var mousePos = get_viewport().get_mouse_position();
	var ray_or = project_ray_origin(mousePos);
	
	var dist = (ray_or.y - 0.5) / cos(rotation.x);
	
	mousePos3D = ray_or + project_ray_normal(mousePos) * dist;
