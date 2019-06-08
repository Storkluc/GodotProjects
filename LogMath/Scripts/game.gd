extends Node

onready var knight = get_node("knight")
onready var camera = get_node("dead_camera")

func _ready():
	pass
	
func change_camera():
	camera.set_global_pos(knight.get_node("camera").get_camera_pos())
	camera.make_current()


func _on_personagem_morreu():
	change_camera()
