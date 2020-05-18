extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var PelicanCam_speed = 0.02
var IntroCam_speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$IntroCam.make_current()
	play_intro()
	
func _process(delta):
	pass
	
func play_intro():
	$AnimationPlayer.play("Intro")
	
func pelican_fly():
	$"Path/PathFollow/D77TC Pelican".visible = true
	$"Path/PathFollow/D77TC Pelican/flybyaudio".play()
	$AnimationPlayer.play("PelicanIntro")
	
	
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		$AnimationPlayer.stop()
		$PelicanCam.make_current()
		pelican_fly()
	if anim_name == "PelicanIntro":
		get_tree().change_scene("res://Scene2.tscn")
