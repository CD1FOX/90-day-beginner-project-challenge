extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Day5":
		Global1.score += 1
		$"../../Score".text = "Score: " + str(Global1.score)
		queue_free()
