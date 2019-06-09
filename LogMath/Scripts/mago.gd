extends KinematicBody2D

var sent = 1
var vivo = true

signal morto

func _ready():
	set_fixed_process(true)
	
#movimentation of mago
func _fixed_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta*sent*0.25
	if sent == 1 and new_offset >= 0.9999:
		sent = -1
		get_parent().set_unit_offset(0.9999)
		get_node("Sprite").set_flip_h(true)
	elif sent == -1 and new_offset <= 0:
		sent = 1
		get_parent().set_unit_offset(0)
		get_node("Sprite").set_flip_h(false)
	else:
		get_parent().set_unit_offset(new_offset)
		

#Dead of mago
func esmagar():
	if not vivo: return
	vivo = false
	get_node("anim").stop()
	get_node("Sprite").set_texture(load("res://wizard/dead_4.png"))
	get_node("Sprite").set_offset(Vector2(0,9))
	get_node("shape").queue_free()
	set_fixed_process(false)

