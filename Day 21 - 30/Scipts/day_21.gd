extends Node2D


func _ready() -> void:
	$Label.text = str(int($HSlider.value))
	$AudioStreamPlayer2D.volume_db = $HSlider.value


func _on_h_slider_value_changed(value: float) -> void:
	$Label.text = str(int(value))
	$AudioStreamPlayer2D.volume_db = value
	print($AudioStreamPlayer2D.volume_db)
