extends Node2D

@onready var bg1 := $Background1
@onready var bg2 := $Background2

var scroll_speed : float = 100.0

func _process(delta: float) -> void:
	bg1.position.x -= scroll_speed * delta
	bg2.position.x -= scroll_speed * delta
	
	var screen_width = get_viewport_rect().size.x
	
	if bg1.position.x <= -screen_width:
		bg1.position.x = bg2.position.x + screen_width
	
	if bg2.position.x <= -screen_width:
		bg2.position.x = bg1.position.x + screen_width
