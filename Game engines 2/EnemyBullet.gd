extends Area

var target = null
var speed = 200.0
var original_target_location

func _process(delta):
	if target:
#        self.look_at(target.global_transform.origin, Vector3.UP)
		self.translate(Vector3.FORWARD * (speed * delta))
#        if self.global_transform.origin.distance_to(target.global_transform.origin) >= 3000:
#            queue_free()

func setTarget(t):
	target = t
	self.look_at(target.global_transform.origin, Vector3.UP)
	original_target_location = target.global_transform.origin

func getTargetLocation():
	return original_target_location


func _on_VisibilityNotifier_screen_exited():
	print("Bullet exited the screen")
	queue_free()
#    pass # Replace with function body.
