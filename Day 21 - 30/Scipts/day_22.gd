extends Control

# Dialogue lines (you can load these from a file later)
var dialogue_lines := [
	"[b]Hero:[/b] Hello there!",
	"[b]Villager:[/b] The monsters are near!",
	"[b]Hero:[/b] I’ll protect the village!"
]

var current_line_index := 0
var full_text := ""
var visible_char_count := 0

@onready var dialogue_text := $DialogueText
@onready var next_button := $NextButton
@onready var type_timer := $TypeTimer

func _ready() -> void:
	next_button.pressed.connect(_on_next_pressed)
	type_timer.timeout.connect(_on_type_timer_timeout)
	
	show_next_line()

func show_next_line() -> void:
	if current_line_index >= dialogue_lines.size():
		dialogue_text.text = "[b]End of dialogue.[/b]"
		next_button.disabled = true
		return

	full_text = dialogue_lines[current_line_index]
	dialogue_text.text = ""  # Clear previous text
	visible_char_count = 0
	type_timer.start()

func _on_type_timer_timeout() -> void:
	visible_char_count += 1

	if visible_char_count <= full_text.length():
		dialogue_text.text = full_text.substr(0, visible_char_count)
	else:
		type_timer.stop()

func _on_next_pressed() -> void:
	# If still typing, skip to full line
	if type_timer.is_stopped():
		current_line_index += 1
		show_next_line()
	else:
		dialogue_text.text = full_text
		type_timer.stop()
