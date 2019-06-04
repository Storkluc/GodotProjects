extends Area2D

func _on_coin_body_enter( body ):
	body.moeda()
	get_node("animation").play("Coletar")
	get_node("shape").queue_free()
	yield(get_node("animation"), "finished")
	queue_free()
