extends Spatial


var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		$AudioStreamPlayer.play()
		$Skeleton.visible = false
		$AnimatedSprite3D.play()
		if $AnimatedSprite3D.get_frame() == 24:
			queue_free()


func _on_Area_area_entered(area):
	if area.is_in_group("Bullet"):
		health = health - 20
		print("Hit")
