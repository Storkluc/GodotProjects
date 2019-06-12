extends StaticBody2D

signal moedas

func destruir():
	print("Destruir")
	get_node("sprite").queue_free()
	get_node("shape").queue_free()
	get_node("particles").set_emitting(true)
	emit_signal("moedas")
