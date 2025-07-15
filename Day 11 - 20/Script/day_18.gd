extends Area2D

var dragging : bool = false
var turn_off = false
var drag_offset : Vector2 = Vector2.ZERO

func _on_color_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not turn_off:
			dragging = true
			drag_offset = get_global_mouse_position() - global_position
		elif not event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not turn_off:
			dragging = false

func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - drag_offset
	
	if turn_off:
		var target_pos = global_position - Vector2(0, -100)
		global_position = global_position.lerp(target_pos, 0.05)
		

func _on_area_entered(_area: Area2D) -> void:
	dragging = false
	turn_off = true
	

	
