extends Spatial


onready var pelican = get_node(".")
var speed = 30
var in_area

var total = 0

var avoiding = false
var avoidance_normal
var avoiding_shot

func _ready():
	$pelicanaudio.play()
	$music.play()
	
func _process(delta):
	if in_area == true:
		if avoidance_normal:
			pelican.transform.origin = lerp(pelican.transform.origin, pelican.transform.origin + avoidance_normal, delta * 10)
#            print(lerped)
#            pelican.translate(pelican.origin - lerped)
		
		pelican.translate(-(Vector3.FORWARD) * (speed * delta))
		
	if total >= 50:#not avoiding and total >= 50:
		total = 0
		var shots = getShots()
		for shot in shots:
#            if avoiding:
#                break
				
			var dist = shot.global_transform.origin.distance_to(self.global_transform.origin)
			#print("Distance between shot and ship ", dist)
			if dist <= 150.0:
#                var result = space_state.intersect_ray(shot.global_transform.origin, self.global_transform.origin, [shot], 2147483647, true, true)
				var target = shot.getTargetLocation()
				if not target: continue
				
				var space_state = get_world().direct_space_state
				var result = space_state.intersect_ray(shot.global_transform.origin, target, [shot], 2147483647, true, true)
				#print("Result from intersect ", result)
				if result and result.collider.is_in_group("Pelican"):
					if avoiding_shot and avoiding_shot.get_ref() == shot: continue
					avoiding_shot = weakref(shot)
					print(dist)
					#print(result)
					avoid(result.normal)
	if avoiding:
#        print(avoiding_shot.get_ref())
#        print(avoiding_shot.get_ref() == null)
		if !avoiding_shot.get_ref():
			stop_avoiding()
#        print(shots)
#    print(delta)
	total = total + (delta * 1000)
	
func avoid(normal):
	avoiding = true
#    if avoidance_normal != Vector3.ZERO:
#        avoidance_normal = avoidance_normal + normal / 2
#    else:
#        avoidance_normal = normal
	#avoidance_normal = Vector3(rand_range(-5, 5), rand_range(-5, 5), 0)
#    if rand_range(0, 1) < 0.5:
	if normal.x > 0:
		$AnimationPlayer.play("right")
		avoidance_normal = Vector3(rand_range(5.0, 10.0), 0, 0)
	else:
		$AnimationPlayer.play("left")
		avoidance_normal = Vector3(rand_range(-5.0, -10.0), 0, 0)
	
#    if abs(normal.y) > 0.5:
	if rand_range(0, 1) < 0.5:
		avoidance_normal = avoidance_normal + Vector3(0, rand_range(0.0, 5.0), 0)
	else:
		avoidance_normal = avoidance_normal + Vector3(0, rand_range(0.0, -5.0), 0)
		
#    if normal.x < 0:
#        avoidance_normal = Vector3(0, 0, 5)
#    else:
#        avoidance_normal = Vector3(0, 0, -5)
#
#
#    if abs(normal.y) < 0.5:
#        avoidance_normal = avoidance_normal + Vector3(0, 5 * abs(normal.y), 0) 
#    else:
#        avoidance_normal = avoidance_normal + Vector3(0, -5 * abs(normal.y), 0) 
func stop_avoiding():
	avoidance_normal = null
	avoiding = false
	print("Not avoiding anymore lol")
		
func getShots():
	return get_tree().get_nodes_in_group("bullets")
	
func _on_Pelican_area_entered(area):
	in_area = true
#    print("Hello from an area ", area)


func _on_Pelican_area_exited(area):
	if area.is_in_group("Enemy"):
		in_area = false
		print("Stopping")
		get_tree().change_scene("res://Scene4.tscn")
