extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 800.0
const DECEL = 600.0
const ICE_DECEL = 50.0  # very low deceleration for slippery feel

var on_ice: bool = false  # You toggle this with raycast or Area2D

func _physics_process(delta):
	var input_dir = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	
	if is_on_floor():
		on_ice = true
	else:
		on_ice = false

	if on_ice:
		if input_dir != Vector2.ZERO:
			velocity = velocity.move_toward(input_dir * SPEED, ACCEL * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, ICE_DECEL * delta)
	else:
		if input_dir != Vector2.ZERO:
			velocity = velocity.move_toward(input_dir * SPEED, ACCEL * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, DECEL * delta)

	move_and_slide()  # No arguments in Godot 4.4+
