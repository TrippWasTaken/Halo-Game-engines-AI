extends PathFollow

onready var pelican = $"D77TC Pelican"
var speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pelican.visible == true:
		offset += delta * speed

