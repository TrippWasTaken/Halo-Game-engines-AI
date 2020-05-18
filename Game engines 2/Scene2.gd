extends Spatial

var ship_speed = 100
var slipspace_speed = 5

func _ready():
	$CovenantCarrier.visible = false
	$"D77TC Pelican".visible = true
	$Pelicancam.make_current()
	play_intro()
	$idlesound.play()


func _process(delta):
	if $CovenantCarrier.visible == true:
		$CovenantCarrier.translate(Vector3(ship_speed * delta,0,0))

func play_intro():
	$AnimationPlayer.play("Scene2Intro")

func Covship_intro():
	$AnimationPlayer.play("covcam")
	$CovenantCarrier.visible = true
	$suspense.play()
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Scene2Intro":
		$slipspacesound.play()
		$slipspacesound.stream.set_loop(false)
		$AnimationPlayer.stop()
		$"D77TC Pelican".visible = false
		$Covcam.make_current()
		Covship_intro()
	if anim_name == "covcam":
		get_tree().change_scene("res://Scene3.tscn")
