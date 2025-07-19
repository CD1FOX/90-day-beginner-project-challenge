extends Node2D


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Day 21 - 30/day_28_1.tscn")


func _on_option_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Day 21 - 30/day_28_2.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
