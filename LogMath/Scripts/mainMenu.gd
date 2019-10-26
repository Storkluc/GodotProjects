extends Node

func _on_play_pressed():
	transition.fade_to("res://Scenes/Tutorial.tscn")

func _on_settings_pressed():
	transition.fade_to("res://Scenes/settings.tscn")
