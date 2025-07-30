extends Node2D

var points : int = 0

func _on_button_pressed() -> void:
	points += 1
	print(points)


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Day 41 - 50/day_43(Death_Screen).tscn")
