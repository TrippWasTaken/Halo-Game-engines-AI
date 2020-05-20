extends Spatial

const BULLET = preload("res://PelicanBullet.tscn")
var target
var BulletPosition
onready var pelican = get_node(".")
var target_set = false
var timer = 0
var rand_time = 0
var speed = 10
var targets_hit = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	rand_time = rand_range(0, 500)

func _process(delta):
	if target:
		$gun.look_at(target.global_transform.origin, Vector3.UP)
	
	if target_set != true and pelican.visible == true and targets_hit != 3:
		pelican.translate(-(Vector3.FORWARD) * (speed * delta))
		
	if targets_hit == 3:
		if timer >= 100:
			speed = speed * 1.1
			timer = 0
			
		pelican.translate(-(Vector3.FORWARD) * (speed * delta))
	if target and timer >= 1000:
		timer = 0
		rand_time = rand_range(0, 500)
#        print("Shoot")
		#$canon.look_at(target.global_transform.origin, Vector3.UP)
		var root = pelican.get_tree().get_root()
		var bullet = BULLET.instance()
		root.add_child(bullet)
		bullet.transform.origin = $gun.global_transform.origin
		bullet.setTarget(target)
		$AudioStreamPlayer.play()
	timer = timer + (delta * 1000)
		
func _on_Area_area_entered(area):
	if area.is_in_group("Banshee") and pelican.visible == true:
		target = area
		target_set = true
		print("Target set to area ", area)


func _on_Area_area_exited(area):
	if area.is_in_group("Banshee") and pelican.visible == true:
		target = null
		target_set = false
		print("Target exited area")
		targets_hit = targets_hit + 1
		print(targets_hit)
