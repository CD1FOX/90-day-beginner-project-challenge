extends CharacterBody2D # Or use Node2D if you don't need move_and_slide

var player_touching = false
var player: Node2D = null
var offset: Vector2
var is_attached = false

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Dash") and player_touching:
		offset = global_position - player.global_position
		is_attached = true

	if Input.is_action_just_released("Dash"):
		is_attached = false

	if is_attached and player:
		global_position = player.global_position + offset

func _on_box_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player_touching = true

func _on_box_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_touching = false
		player = null
