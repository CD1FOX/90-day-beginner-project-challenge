extends CharacterBody2D

var speed = 300
var jump_power = -500
var jump_counter = 0
var gravity = 1000

func _physics_process(_delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * _delta
	else:
		# Reset jump counter when touching the ground
		jump_counter = 0
	
	#wall detection
	if is_on_wall_only() and not is_on_floor() and (Input.get_axis("ui_left", "ui_right")):
		jump_counter = 0
		

	# Jumping logic (allow 2 jumps: 1 ground jump + 1 air jump)
	if Input.is_action_just_pressed("jump") and jump_counter < 2:
		velocity.y = jump_power
		jump_counter += 1

	# Horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
