extends Spatial

const BULLET = preload("res://EnemyBullet.tscn")
var target
var BulletPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	if target:
		$canon.look_at(target.global_transform.origin, Vector3.UP)
		$canon2.look_at(target.global_transform.origin, Vector3.UP)
		$canon3.look_at(target.global_transform.origin, Vector3.UP)
		
	if (Input.is_action_pressed("shoot")):
		print("Shoot")
		var bullet = BULLET.instance()
		var direction = $canon.look_at(target.global_transform.origin, Vector3.UP)
		
		
func _on_Area_area_entered(area):
	if area.is_in_group("Pelican"):
		target = area


func _on_Area_area_exited(area):
	if area.is_in_group("Pelican"):
		target = null
