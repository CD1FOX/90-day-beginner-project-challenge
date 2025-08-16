extends CharacterBody2D

var speed = 250
var can_tele = false
var current_pad = 0  # 0 = none, 1 = pad1, 2 = pad2

@onready var tele_pad_1 = $"../TelePad1"
@onready var tele_pad_2 = $"../TelePad2"

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if Input.is_action_just_pressed("Dash") and can_tele:
		teleport()

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

func teleport() -> void:
	if current_pad == 1:
		position = tele_pad_2.position
	elif current_pad == 2:
		position = tele_pad_1.position

# TelePad1
func _on_tele_pad_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		can_tele = true
		current_pad = 1

func _on_tele_pad_1_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		can_tele = false
		current_pad = 0


func _on_tele_pad_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		can_tele = true
		current_pad = 2

func _on_tele_pad_2_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		can_tele = false
		current_pad = 0
