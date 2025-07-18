extends Node2D

var minutes = 0
var seconds = 55

func _process(delta: float) -> void:
	seconds += delta
	if seconds >= 60:
		minutes += 1
		seconds -= 60
	
	$Label.text = "%02d:%02d" % [minutes, seconds]
