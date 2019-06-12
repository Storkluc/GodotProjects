extends KinematicBody2D

var sent = 0

signal ou
signal e
signal oux

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
	emit_signal("e")



func _on_controlBoxOX_pressed():
	emit_signal("oux")


func _on_body_e():
	sent = 1


func _on_body_oux():
	if sent == 1:
		sent = 0
		emit_signal("oux")
