extends Node2D

var stamina = 100
@onready var stamina_bar = $ProgressBar

func _process(delta: float) -> void:
	if Input.is_action_pressed("Dash2"):
		stamina -= 10 * delta
	else:
		if stamina <= 100:
			await get_tree().create_timer(0.5).timeout
			stamina += 10 * delta
	
	stamina_bar.value = stamina
	
