extends Node2D

func _on_nextPage_pressed():
	transition.fade_to("res://Scenes/game.tscn")

func _on_backPage_pressed():
	transition.fade_to("res://Scenes/Tutorial.tscn")
