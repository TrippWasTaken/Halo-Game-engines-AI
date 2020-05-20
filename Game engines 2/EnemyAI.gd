extends Spatial

const BULLET = preload("res://EnemyBullet.tscn")
var target
var BulletPosition

var timer = 0
var rand_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rand_time = rand_range(0, 500)
	pass


func _process(delta):
	if target:
		$canon.look_at(target.global_transform.origin, Vector3.UP)
		$canon2.look_at(target.global_transform.origin, Vector3.UP)
		$canon3.look_at(target.global_transform.origin, Vector3.UP)
		
#    (Input.is_action_pressed("shoot")) and 
	if target and timer >= 1000 + rand_time:
		timer = 0
		rand_time = rand_range(0, 500)
#        print("Shoot")
		#$canon.look_at(target.global_transform.origin, Vector3.UP)
		var root = $canon.get_tree().get_root()
		var rand = rand_range(0, 3.0)
#        print(rand)
		var bullet = BULLET.instance()
		$shots.play()
		root.add_child(bullet)
		if rand <= 1.0:
			bullet.transform.origin = $canon.global_transform.origin
		elif rand <= 2.0:    
			bullet.transform.origin = $canon2.global_transform.origin
		else:
			bullet.transform.origin = $canon3.global_transform.origin
#        print(bullet.transform.origin)
		bullet.setTarget(target)
#        for canon in canons:
#            bullet.transform.origin = canon.global_transform.origin
#            root.add_child(bullet)
#            bullet.setTarget(target)
	timer = timer + (delta * 1000)
		
		
func _on_Area_area_entered(area):
	if area.is_in_group("Pelican"):
		target = area
		print("Target set to area ", area)


func _on_Area_area_exited(area):
	if area.is_in_group("Pelican"):
		target = null
		print("Target exited area")
