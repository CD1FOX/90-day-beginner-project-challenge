extends CharacterBody2D

@export var move_duration := 3.0
@export var x_range := Vector2(40, 1112)
@export var y_range := Vector2(40, 608)

func _ready() -> void:
	randomize()  # Ensure different randoms each run
	move_to_random_position()

func move_to_random_position():
	var new_position = Vector2(
		randf_range(x_range.x, x_range.y),
		randf_range(y_range.x, y_range.y)
	)

	var tween = create_tween()
	tween.tween_property(self, "global_position", new_position, move_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished

	await get_tree().create_timer(0.5).timeout  # Optional small pause
	move_to_random_position()
