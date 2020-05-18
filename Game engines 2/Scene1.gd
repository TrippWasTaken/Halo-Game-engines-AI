extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ring_speed = 0.005
var camera_speed = 0.02

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$Ring.rotate_y(delta * ring_speed)
	$Camera.rotate_x(-delta * camera_speed)
	$Camera.rotate_y(delta * camera_speed)
	
