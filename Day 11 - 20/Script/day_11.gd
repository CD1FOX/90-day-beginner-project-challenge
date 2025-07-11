extends Node2D

var rand_x
var rand_y
@onready var enemy_node = $Enemy

func _ready() -> void:
	while true:
		rand_x = randf_range(40.0, 1112.0)
		rand_y = randf_range(40.0, 608.0)
		
		
		var clone = enemy_node.duplicate()
		clone.position = Vector2(rand_x, rand_y)
		add_child(clone)
		await get_tree().create_timer(3).timeout

	

	
