extends Node

onready var knight = get_node("knight")
onready var camera = get_node("dead_camera")
onready var cleanMago = get_node("body")

func _ready():
	pass
	
func change_camera():
	camera.set_global_pos(knight.get_node("camera").get_camera_pos())
	camera.make_current()

func _on_personagem_morreu():
	change_camera()
	
	get_node("spawTimer").set_wait_time(1.5)
	get_node("spawTimer").start()

func _on_spawTimer_timeout():
	reviver()

func reviver():
	knight.set_pos(get_node("spawPoint").get_pos())
	knight.reviver()
	


func _on_knight_fim():
	change_camera()
	
	get_node("spawTimer").set_wait_time(2)
	get_node("spawTimer").start()


func _on_body_morto():
	cleanMago.queue_free()
