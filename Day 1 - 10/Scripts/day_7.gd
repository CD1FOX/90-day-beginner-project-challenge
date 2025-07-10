extends Node2D

var enemy = preload("res://Day 1 - 10/day_4.tscn")

func _on_button_pressed() -> void:
	var instance = enemy.instantiate()
	add_child(instance)
