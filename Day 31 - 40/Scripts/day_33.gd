extends CharacterBody2D

var speed = 300
var direction
@onready var animation = $AnimatedSprite2D

@export var bullet_scene: PackedScene
var bullet_direction = Vector2.ZERO
var bullet_spawn_position

# Recoil strength (pixels per frame)
@export var recoil_strength := 100.0

func _physics_process(_delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		bullet_spawn_position = $LeftBulletSpawnPoint
		bullet_direction = Vector2.LEFT
		direction.x -= 1
		animation.play("left")
	elif Input.is_action_pressed("ui_right"):
		bullet_spawn_position = $RightBulletSpawnPoint
		bullet_direction = Vector2.RIGHT
		direction.x += 1
		animation.play("right")
	elif Input.is_action_pressed("ui_up"):
		bullet_spawn_position = $UpBulletSpawnPoint
		bullet_direction = Vector2.UP
		direction.y -= 1
		animation.play("up")
	elif Input.is_action_pressed("ui_down"):
		bullet_spawn_position = $DownBulletSpawnPoint
		bullet_direction = Vector2.DOWN
		direction.y += 1
		animation.play("down")
	else:
		animation.play("Idle")
	
	if Input.is_action_just_pressed("shoot"):
		shoot_bullet()

	# Normalize to keep consistent speed in diagonals
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = bullet_spawn_position.global_position
	bullet.velocity = bullet_direction * bullet.speed
	get_tree().current_scene.add_child(bullet)
	
	position -= bullet_direction * recoil_strength
	
