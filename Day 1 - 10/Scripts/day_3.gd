extends CharacterBody2D

var speed = 300
var direction

func _physics_process(_delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
