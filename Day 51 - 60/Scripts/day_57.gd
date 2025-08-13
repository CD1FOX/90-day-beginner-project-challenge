extends Node2D

var cooldown_timer = 0
var cooldown = 2
var can_attack = false

func _process(delta: float) -> void:
	if cooldown_timer <= cooldown:
		cooldown_timer += delta
	else:
		can_attack = true

	
	if Input.is_action_just_pressed("Dash"):
		if can_attack:
			print("Attacked")
			cooldown_timer = 0
			can_attack = false
		else:
			print("Cooldown")
	
