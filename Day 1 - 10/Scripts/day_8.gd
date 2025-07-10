extends CharacterBody2D

var speed = 300
var health = Global1.health
var direction
@onready var animation = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	Health_Updater()
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
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Enemy":
		health -= 10


func Health_Updater():
	$ProgressBar.value = health
