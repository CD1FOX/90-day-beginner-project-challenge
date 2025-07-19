extends Node2D

var orig_player_speed

func _on_speed_boost_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		orig_player_speed = body.speed
		body.speed *= 3
		$SpeedBoost.queue_free()
		await get_tree().create_timer(5).timeout
		body.speed = orig_player_speed
		
