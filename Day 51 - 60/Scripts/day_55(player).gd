extends CharacterBody2D

var speed = 300
var throwable_object = null

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Dash") and throwable_object != null:
		var tween = create_tween()
		tween.tween_property(throwable_object, "position", Vector2(position.x + 5000, position.y), 2)
		tween.stop()
		tween.play()
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
