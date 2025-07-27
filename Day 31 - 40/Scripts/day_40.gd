extends Node2D

@onready var combo_label : Label = $ComboLabel
@onready var combo_timer : Timer = $ComboTimer

var combo_hits : int = 0



func _on_combo_button_pressed() -> void:
	combo_hits += 1
	combo_label.text = "Combo: %d" % combo_hits
	combo_timer.start()


func _on_combo_timer_timeout() -> void:
	combo_hits = 0
	combo_label.text = "Combo Over!"
