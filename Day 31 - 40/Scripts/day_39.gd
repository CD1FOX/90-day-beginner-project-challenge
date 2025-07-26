extends Node2D

@onready var player_health_bar = $CharacterBody2D/ProgressBar
@onready var player = $CharacterBody2D

func _on_button_pressed() -> void:
	player_health_bar.value -= 5
	var tween = create_tween()
	tween.tween_property(player, "modulate", Color.RED, 0.1)
	tween.tween_interval(0.05)
	tween.tween_property(player, "modulate", Color.WHITE, 0.1)
	
	var tween2 = create_tween()
	var original_pos = player.position
	tween2.tween_property(player, "position", original_pos + Vector2(10, 0), 0.05)
	tween2.tween_property(player, "position", original_pos - Vector2(10, 0), 0.05)
	tween2.tween_property(player, "position", original_pos, 0.05)
	
	
