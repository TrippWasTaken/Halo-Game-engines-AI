extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("campan")
	$Label.visible = false
	$voice.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "campan":
		$Label.visible = true
		$Timer.start(8)


func _on_Timer_timeout():
	get_tree().quit()
