extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://Day 21 - 30/day_24.tscn")
