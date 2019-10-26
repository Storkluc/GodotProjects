extends Node

func _on_onSom_toggled( pressed ):
	pass


func _on_backPage_pressed():
	transition.fade_to("res://Scenes/mainMenu.tscn")


func _on_help_pressed():
	transition.fade_to("res://Scenes/informarProblema.tscn")
