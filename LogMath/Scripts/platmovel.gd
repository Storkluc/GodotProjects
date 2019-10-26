extends KinematicBody2D

var sent = 0
var anD = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta*sent*0.2
	if sent == 1 and new_offset >= 0.9999:
		sent = -1
		get_parent().set_unit_offset(0.9999)
	elif sent == -1 and new_offset <= 0:
		sent = 1
		get_parent().set_unit_offset(0)
	else:
		get_parent().set_unit_offset(new_offset)


func _on_controlBoxAnd_pressed():
	sent = 1

func _on_controlBoxOr_pressed():
	sent = -1

func _on_controlBoxOx_pressed():
	if sent == 1:
		sent = 0