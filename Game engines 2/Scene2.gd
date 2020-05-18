extends Spatial

var ship_speed = 20
var slipspace_speed = 5

func _ready():
	$slipspace.visible = false
	$CovenantCarrier.visible = false
	$"D77TC Pelican".visible = true
	$Pelicancam.make_current()
	play_intro()


func _process(delta):
	if $CovenantCarrier.visible == true:
		$CovenantCarrier.translate(Vector3(ship_speed * delta,0,0))
	
	if $slipspace.visible == true:
		$slipspace.rotate_z(slipspace_speed * delta)

func play_intro():
	$AnimationPlayer.play("Scene2Intro")

func Covship_intro():
	$AnimationPlayer.play("slipspace fade")
	$slipspace.visible = true
	$CovenantCarrier.visible = true
	$slipspace.rotate_x(10)
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Scene2Intro":
		$AnimationPlayer.stop()
		$"D77TC Pelican".visible = false
		$Covcam.make_current()
		Covship_intro()
