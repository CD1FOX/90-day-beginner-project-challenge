extends Node2D

@onready var portrait: TextureRect = $"Resizable background/Portrait"
@onready var dialogue_label: Label = $"Resizable background/DialogueText"

func _ready():
	show_dialogue("Hello there!", "Granger")
	await get_tree().create_timer(2).timeout
	show_dialogue("Hi, how are you?", "Miya")

func show_dialogue(line_text: String, speaker: String):
	dialogue_label.text = line_text
	var portrait_path = "res://Day 61 - 70/Assets/%s.png" % speaker.to_lower()
	if FileAccess.file_exists(portrait_path):
		portrait.texture = load(portrait_path)
	else:
		portrait.texture = null
