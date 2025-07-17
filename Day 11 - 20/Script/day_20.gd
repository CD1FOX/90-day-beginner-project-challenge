extends Node2D

@onready var button_sound_effect = $ButtonClick
var clicked = false

func _on_button_pressed() -> void:
	if not clicked:
		clicked = true
		button_sound_effect.play()
	await button_sound_effect.finished
	clicked = false
	
