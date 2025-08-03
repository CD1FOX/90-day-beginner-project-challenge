extends Node2D

@onready var timer = $Timer

func _on_timer_timeout() -> void:
	print("Spike Activated")
	await get_tree().create_timer(1).timeout
	timer.start()
