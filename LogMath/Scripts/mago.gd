extends KinematicBody2D

var sent = 1

func _ready():
	set_fixed_process(true)

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
