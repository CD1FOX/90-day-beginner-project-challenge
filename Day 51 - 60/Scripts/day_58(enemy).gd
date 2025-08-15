extends CharacterBody2D

var run_speed = 100
var player: Node2D = null

@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _physics_process(_delta):
	velocity = Vector2.ZERO

	if player:
		# Set target to player's global position
		nav.target_position = player.global_position

		# Get the next waypoint in the path
		var next_point: Vector2 = nav.get_next_path_position()

		# Direction from current position to next waypoint
		var direction: Vector2 = (next_point - global_position).normalized()

		# Set velocity toward that direction
		velocity = direction * run_speed

	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
