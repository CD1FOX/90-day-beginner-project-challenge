extends Node2D

@onready var fade_rect: ColorRect = $ColorRect
var faded_out := false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		var tween = get_tree().create_tween()

		if faded_out:
			tween.tween_property(fade_rect, "modulate:a", 0.0, 1.0) # Fade in (black → transparent)
		else:
			tween.tween_property(fade_rect, "modulate:a", 1.0, 1.0) # Fade out (transparent → black)

		faded_out = !faded_out
