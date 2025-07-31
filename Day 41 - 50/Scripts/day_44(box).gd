extends StaticBody2D

var health = 3

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.box_touching = false
		body.node_receiver = null



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.box_touching = true
		body.node_receiver = self
