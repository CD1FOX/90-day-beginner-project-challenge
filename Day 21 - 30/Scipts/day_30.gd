extends CharacterBody2D

var speed = 300
var direction = Vector2.ZERO
@onready var animation = $AnimatedSprite2D
var dashing = false
var dashing_timer = 0.0
var dashing_direction = Vector2.ZERO

@export var bullet_scene: PackedScene
var bullet_direction = Vector2.ZERO
var bullet_spawn_position

@export var dash_speed = 900
@export var dash_duration = 0.5  # in seconds

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		bullet_spawn_position = $LeftBulletSpawnPoint
		bullet_direction = Vector2.LEFT
		direction.x -= 1
		animation.play("left")
	if Input.is_action_pressed("ui_right"):
		bullet_spawn_position = $RightBulletSpawnPoint
		bullet_direction = Vector2.RIGHT
		direction.x += 1
		animation.play("right")
	if Input.is_action_pressed("ui_up"):
		bullet_spawn_position = $UpBulletSpawnPoint
		bullet_direction = Vector2.UP
		direction.y -= 1
		animation.play("up")
	if Input.is_action_pressed("ui_down"):
		bullet_spawn_position = $DownBulletSpawnPoint
		bullet_direction = Vector2.DOWN
		direction.y += 1
		animation.play("down")
	
	if Input.is_action_just_pressed("Dash") and not dashing:
		dashing_skill()
	
	if Input.is_action_just_pressed("shoot"):
		shoot_bullet()

	if direction == Vector2.ZERO and not dashing:
		animation.play("Idle")

	# Movement
	if dashing:
		dashing_timer -= delta
		velocity = dashing_direction * dash_speed
		if dashing_timer <= 0:
			dashing = false
	else:
		velocity = direction.normalized() * speed

	move_and_slide()

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = bullet_spawn_position.global_position
	bullet.velocity = bullet_direction * bullet.speed
	get_tree().current_scene.add_child(bullet)

func dashing_skill():
	dashing = true
	dashing_direction = bullet_direction if bullet_direction != Vector2.ZERO else Vector2.RIGHT
	dashing_timer = dash_duration
