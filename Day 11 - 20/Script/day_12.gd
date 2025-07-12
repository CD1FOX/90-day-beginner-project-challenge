extends Node2D

@onready var timer = $Timer
@onready var timer_label = $Label

func _ready() -> void:
	timer.one_shot = true
	timer.start(5)
	pass

func _on_timer_timeout() -> void:
	get_tree().quit()


func _process(_delta: float) -> void:
	timer_label.text = "Timeleft: " + str(int(timer.time_left))
