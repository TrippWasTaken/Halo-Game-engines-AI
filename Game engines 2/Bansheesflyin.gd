extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
var speed = 2.5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$fightcam.translate((Vector3.LEFT) * (speed * delta))
