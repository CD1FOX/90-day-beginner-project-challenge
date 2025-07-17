extends Node2D


func _ready() -> void:
	$Label.text = str(int($HSlider.value))
	$AudioStreamPlayer2D.volume_db = $HSlider.value


func _on_h_slider_value_changed(value: float) -> void:
	var volume_db = lerp(-80.0, 0.0, value / 80.0)
	$Label.text = str(int(volume_db))
	$AudioStreamPlayer2D.volume_db = value
	print($AudioStreamPlayer2D.volume_db)
