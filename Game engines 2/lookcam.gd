extends Camera

onready var target = get_node("Path/PathFollow/Banshees")
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_transform.origin = lerp(global_transform.origin, target.global_transform.origin, delta*speed)
	var current_rotation = Quat(global_transform.basis)
	var next_rotation = current_rotation.slerp(Quat(target.global_transform.basis), delta*speed)
	global_transform.basis = Basis(next_rotation)
