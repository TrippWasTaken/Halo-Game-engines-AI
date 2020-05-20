extends Area

var target = null
var speed = 200.0
var original_target_location

func _process(delta):
	self.translate(Vector3.FORWARD * (speed * delta))

func setTarget(t):
	target = t
	self.look_at(target.global_transform.origin, Vector3.UP)
	original_target_location = target.global_transform.origin
	
func _on_Area_area_entered(area):
	if area.is_in_group("Banshee"):
		queue_free()
