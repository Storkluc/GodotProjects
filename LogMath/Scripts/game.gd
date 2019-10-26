extends Node

onready var knight = get_node("knight")
onready var camera = get_node("dead_camera")

var moedas = 0
var diamonds = 0
var score = 0
var vidas = 3

func _ready():
	pass
	
func change_camera():
	camera.set_global_pos(knight.get_node("camera").get_camera_pos())
	camera.make_current()

func _on_personagem_morreu():
	change_camera()
	
	get_node("spawTimer").set_wait_time(1.5)
	get_node("spawTimer").start()
	
	vidas -= 1
	print(vidas)
	if vidas == 2:
		print("entrei")
		get_node("gameTouch/Panel/heart1").set_texture(load("res://Icons/hud_heartEmpty.png"))
	elif vidas == 1:
		get_node("gameTouch/Panel/heart2").set_texture(load("res://Icons/hud_heartEmpty.png"))
	elif vidas == 0:
		get_node("gameTouch/Panel/heart3").set_texture(load("res://Icons/hud_heartEmpty.png"))

func _on_spawTimer_timeout():
	if vidas > 0:
		reviver()
	else:
		transition.fade_to("res://Scenes/mainMenu.tscn")
		moedas = 0
		score = 0

func reviver():
	knight.set_pos(get_node("spawPoint").get_pos())
	knight.reviver()

func _on_knight_fim():
	transition.fade_to("res://Scenes/mainMenu.tscn")


func _on_knight_moeda():
	moedas += 1
	score += 1
	get_node("gameTouch/Panel/coins").set_text(str(moedas))
	score()

func _on_knight_diamante():
	diamonds += 1
	score += 50
	get_node("gameTouch/Panel/diamonds").set_text(str(diamonds))
	score()

func score():
	get_node("gameTouch/Panel/score").set_text(str(score))


func _on_body_morto():
	score += 10
	score()

func _on_blockDest_moedas():
	moedas += 5
	get_node("gameTouch/Panel/coins").set_text(str(moedas))
	score += 5
	get_node("gameTouch/Panel/score").set_text(str(score))


func _on_blockDest_2_moedas():
	moedas += 5
	get_node("gameTouch/Panel/coins").set_text(str(moedas))
	score += 5
	get_node("gameTouch/Panel/score").set_text(str(score))



