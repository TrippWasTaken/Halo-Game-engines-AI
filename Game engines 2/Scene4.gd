extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("camera")
	$Bansheesfight.visible = false
	$D77TCPelican.visible = false
	$music.play()
	$voice1.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "camera":
		$AnimationPlayer.play("fadein")
		$Path.queue_free()
		$covcar.queue_free()
		$fightcam.make_current()
		$Bansheesfight.visible = true
		$D77TCPelican.visible = true
	
	if anim_name == "fadein":
		$AnimationPlayer.get_animation("Banshee idle").set_loop(true)
		$AnimationPlayer.play("Banshee idle")
		
	if anim_name == "fade out":
		get_tree().change_scene("res://Scene5.tscn")
	
func _on_VisibilityNotifier_camera_exited(camera):
	if $D77TCPelican.visible == true:
		$AnimationPlayer.play("fade out")
