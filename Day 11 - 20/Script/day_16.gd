extends Node2D


func _on_platform_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		await get_tree().create_timer(1).timeout
		var tween = create_tween()
		tween.tween_property(self, "position", Vector2.DOWN * 1000, 2)
		await tween.finished
		
		$Platform.queue_free()
