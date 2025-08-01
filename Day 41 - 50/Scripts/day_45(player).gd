extends CharacterBody2D

var speed = 300

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
