extends Node

var barril = preload("res://scene/Barril.tscn")
var barrilEsc = preload("res://scene/BarrilEsc.tscn")
var barrilDir = preload("res://scene/BarrilDir.tscn")

onready var felpudo = get_node("Felpudo")
onready var camera = get_node("Camera")
onready var barris = get_node("Barris")
onready var destbarris = get_node("DestBarris")

var ultini

func _ready():
	randomize()
	set_process_input(true)
	
	gerarIni()
	
func _input(event):
	event = camera.make_input_local(event)
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		
		if event.pos.x < 360:
			felpudo.esq()
		else:
			felpudo.dir()
			
	if !verif():
		felpudo.bater()
		var prin = barris.get_children()[0]
		barris.remove_child(prin)
		destbarris.add_child(prin)
		prin.dest(felpudo.lado)
	
func gerarBarril(tipo, pos):
	var novo
	if tipo == 0:
		novo = barril.instance()
		ultini = false
	elif tipo == 1:
		novo = barrilEsc.instance()
		novo.add_to_group("barrilEsc")
		ultini = true
	elif tipo == 2:
		novo = barrilDir.instance()
		novo.add_to_group("barrilDir")
		ultini = true
		
	novo.set_pos(pos)
	barris.add_child(novo)
	
func aleaBarril(pos):
	var num = rand_range(0,3)
	if ultini: num = 0
	gerarBarril(int(num), pos)
	
func gerarIni():
	for i in range(0, 3):
		gerarBarril(0, Vector2(360, 1090 - i*172))
		
	for i in range(3, 10):
		aleaBarril(Vector2(360, 1090 - i*172))
		
func verif():
	var lado = felpudo.lado
	var prin = barris.get_children()[0]
	if lado == felpudo.ESQ and prin.is_in_group("barrilEsc") or lado == felpudo.DIR and prin.is_in_group("barrilDir"):
		return true
	else:
		return false
