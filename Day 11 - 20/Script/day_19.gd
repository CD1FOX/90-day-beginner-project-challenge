extends CharacterBody2D

var speed = 300
var direction
@onready var animation = $AnimatedSprite2D
@onready var shader_material := $AnimatedSprite2D.material as ShaderMaterial

@export var bullet_scene: PackedScene
var bullet_direction = Vector2.ZERO
var bullet_spawn_position

func _physics_process(_delta: float) -> void:
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
	
	if Input.is_action_just_pressed("shoot"):
		shoot_bullet()
	if direction == Vector2(0, 0):
		animation.play("Idle")
	
	print(bullet_direction)
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = bullet_spawn_position.global_position
	
	bullet.velocity = bullet_direction * bullet.speed
	get_tree().current_scene.add_child(bullet)
	flash_red()


func flash_red():
	shader_material.set_shader_parameter("flash", true)
	await get_tree().create_timer(1).timeout
	shader_material.set_shader_parameter("flash", false)
