extends Node2D

var score : int = 0
const SAVE_PATH := "user://highscore.save"

func _ready() -> void:
	load_score()
	update_label()

func _on_increase_score_pressed() -> void:
	score += 1
	save_score()
	update_label()


func update_label():
	$ScoreLabel.text = "Score: %d" % score
	

func save_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(score)
		file.close()

func load_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			score = file.get_32()
			file.close()
	else:
		score = 0
