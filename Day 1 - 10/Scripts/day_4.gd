extends CharacterBody2D

var speed = 300
var direction
@onready var animation = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animation.play("left")
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		animation.play("right")
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		animation.play("up")
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		animation.play("down")
	
	if direction == Vector2(0, 0):
		animation.play("Idle")
	
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
