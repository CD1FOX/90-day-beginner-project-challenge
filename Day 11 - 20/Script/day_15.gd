extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_power = -500

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power
	move_and_slide() 
