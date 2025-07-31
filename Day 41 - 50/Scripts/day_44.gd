extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.box_touching = true
		print(body.box_touching)
