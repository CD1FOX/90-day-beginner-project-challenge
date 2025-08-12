extends CharacterBody2D

var speed = 200
var player = null

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * speed
		
	move_and_slide()

func _on_detection_radius_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body


func _on_detection_radius_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = null
