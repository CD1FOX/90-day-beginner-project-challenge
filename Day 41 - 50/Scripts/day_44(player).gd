extends CharacterBody2D

var speed = 300
var coin = 0

var box_touching = false
var node_receiver : Node2D = null

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	breaking_box()
	
	velocity = velocity.normalized()
	velocity = direction * speed
	move_and_slide()

func breaking_box():
	if Input.is_action_just_pressed("Dash") and box_touching and node_receiver != null:
		node_receiver.health -= 1
		if node_receiver.health <= 0:
			node_receiver.queue_free()
			coin += 1
			print(coin)
