extends Node2D

var score = 0

func _on_increase_score_pressed() -> void:
	score += 1
	$Score.text = "Score: " + str(score)
