extends Spatial


onready var pelican = get_node(".")
var speed = 40
var in_area

func _ready():
	pass

func _process(delta):
	if in_area == true:
		pelican.translate(Vector3(0,0,speed * delta))


func _on_Pelican_area_entered(area):
	in_area = true


func _on_Pelican_area_exited(area):
	if area.is_in_group("Enemy"):
		in_area = false
		print("Stopping")
