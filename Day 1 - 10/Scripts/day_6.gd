extends CharacterBody2D

func _ready() -> void:
	run_looping_tween()

func run_looping_tween() -> void:
	await get_tree().process_frame
	
	while true:
		var tween = create_tween()
		tween.tween_property(self, "position", Vector2((position.x + 500), (position.y)), 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		
		await tween.finished
		await get_tree().create_timer(1).timeout
		
		tween = create_tween()
		tween.tween_property(self, "position", Vector2((position.x - 500), (position.y)), 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		
		await tween.finished
		await get_tree().create_timer(1).timeout
		



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Day4":
		print(1)
