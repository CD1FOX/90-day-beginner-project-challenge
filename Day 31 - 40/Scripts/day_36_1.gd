extends CharacterBody2D

var speed := 300
var can_move := true
var knockback_force := 500
var knockback_duration := 0.2
var knockback_timer := 0.0
var knockback_direction := Vector2.ZERO

@onready var hitbox := $CollisionShape2D

@onready var animation := $AnimatedSprite2D

var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if not can_move:
		# Apply knockback movement
		velocity = knockback_direction * knockback_force
		move_and_slide()

		knockback_timer -= delta
		if knockback_timer <= 0:
			can_move = true
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


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Enemy":
		apply_knockback()

func apply_knockback() -> void:
	can_move = false
	knockback_timer = knockback_duration
	knockback_direction = -direction

	# Use deferred to avoid physics query error
	hitbox.call_deferred("set_disabled", true)

	await get_tree().create_timer(1.0).timeout

	hitbox.disabled = false  # Safe now
