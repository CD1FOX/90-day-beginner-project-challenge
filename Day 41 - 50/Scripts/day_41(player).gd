extends CharacterBody2D

var speed = 300
var jump_power = -500
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var platVel = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * _delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_power
			velocity.x = platVel.x
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	platVel = get_platform_velocity()
