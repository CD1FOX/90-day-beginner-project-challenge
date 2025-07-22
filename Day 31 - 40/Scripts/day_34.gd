extends CharacterBody2D

var speed := 300
var dash_speed := 900
var is_dashing := false
var dash_time := 0.2
var ghost_spawn_interval := 0.05

@export var fading_images_scene: PackedScene
@onready var animation := $AnimatedSprite2D

var direction := Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if is_dashing:
		move_and_slide()
		return

	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
		animation.play("left")
	elif Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
		animation.play("right")
	elif Input.is_action_pressed("ui_up"):
		direction = Vector2.UP
		animation.play("up")
	elif Input.is_action_pressed("ui_down"):
		direction = Vector2.DOWN
		animation.play("down")
	else:
		animation.play("Idle")

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

	if Input.is_action_just_pressed("Dash") and direction != Vector2.ZERO and not is_dashing:
		start_dash(direction)

func start_dash(dash_dir: Vector2) -> void:
	is_dashing = true
	var dash_velocity = dash_dir * dash_speed
	var dash_timer := dash_time
	var ghost_timer := 0.0

	while dash_timer > 0:
		velocity = dash_velocity
		move_and_slide()

		ghost_timer -= get_process_delta_time()
		dash_timer -= get_process_delta_time()

		if ghost_timer <= 0.0:
			spawn_ghost()
			ghost_timer = ghost_spawn_interval

		await get_tree().process_frame  # Smooth dash frame-by-frame

	is_dashing = false

func spawn_ghost() -> void:
	var ghost := fading_images_scene.instantiate()
	ghost.position = global_position
	ghost.z_index = z_index - 1
	get_tree().current_scene.add_child(ghost)

	# Optional: fade-out and free using Tween or Timer
	var timer := get_tree().create_timer(0.4)
	timer.timeout.connect(func(): ghost.queue_free())
