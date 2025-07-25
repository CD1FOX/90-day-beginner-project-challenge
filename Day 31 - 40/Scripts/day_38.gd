extends Node2D

var timer : float = 60.0
var last_clicked_rect: Node = null
var symbol_groups := ["symbol_a", "symbol_b", "symbol_c", "symbol_d", "symbol_e"]

@onready var timer_label : Label = $TimerLabel


func _ready() -> void:
	var color_rects = get_tree().get_nodes_in_group("clickable_color_rects")
	for rect in color_rects:
		rect.gui_input.connect(_on_color_rect_gui_input.bind(rect))

func _process(delta: float) -> void:
	timer -= delta
	timer_label.text = str(int(timer))
	

func _on_easy_pressed() -> void:
	timer = 51.0
	$DifficultyPicker.hide()

func _on_medium_pressed() -> void:
	timer = 31.0
	$DifficultyPicker.hide()

func _on_hard_pressed() -> void:
	timer = 16.0
	$DifficultyPicker.hide()

func _on_color_rect_gui_input(event: InputEvent, sender: Node) -> void:
	await get_tree().create_timer(0.3).timeout
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		sender.hide()

		if last_clicked_rect == null:
			last_clicked_rect = sender
		else:
			var matched := false
			for group in symbol_groups:
				if sender.is_in_group(group) and last_clicked_rect.is_in_group(group):
					matched = true
					break
			if not matched:
				await get_tree().create_timer(0.3).timeout
				last_clicked_rect.show()
				sender.show()

			last_clicked_rect = null
			
			if are_all_symbols_matched():
				print("🚪 Opening the door, all symbols matched!")

func are_all_symbols_matched() -> bool:
	var color_rects = get_tree().get_nodes_in_group("clickable_color_rects")
	for rect in color_rects:
		if rect.visible:
			return false
	return true
