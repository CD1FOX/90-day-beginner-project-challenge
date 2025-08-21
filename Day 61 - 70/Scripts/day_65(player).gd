extends CharacterBody2D

var gravity: float = 800.0
var speed: float = 300.0
var jump_power: float = 400.0
var max_jumps: int = 2
var jumps_done: int = 0

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Reset jump count when on the ground
		jumps_done = 0
	
	# Handle jumping
	if Input.is_action_just_pressed("jump") and jumps_done < max_jumps:
		velocity.y = -jump_power
		jumps_done += 1
	
	# Handle horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	# Apply movement
	move_and_slide()
