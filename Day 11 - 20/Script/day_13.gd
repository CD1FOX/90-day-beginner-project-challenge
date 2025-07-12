extends Node2D

@onready var menu = $Menu

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Menu"):
		menu.visible = not menu.visible

func _on_resume_pressed() -> void:
	menu.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()
