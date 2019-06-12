extends Node

func _on_play_pressed():
	transition.fade_to("res://Scenes/game.tscn")

func _on_settings_pressed():
	transition.fade_to("res://Scenes/settings.tscn")
