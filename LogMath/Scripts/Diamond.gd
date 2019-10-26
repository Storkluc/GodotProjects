extends Node2D

func _on_Area2D_body_enter( body ):
	body.diamante()
	get_node("Area2D/animation").play("coletar")
	get_node("Area2D/shape").queue_free()
	yield(get_node("Area2D/animation"), "finished")
	queue_free()
