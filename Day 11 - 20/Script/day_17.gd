extends CharacterBody2D

var follow_speed : float = 5.0

func _physics_process(delta: float) -> void:
	var target = get_global_mouse_position()
	position = position.lerp(target, follow_speed * delta)
