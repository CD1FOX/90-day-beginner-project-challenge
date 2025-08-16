extends CharacterBody2D

var speed = 300
var charge_power = 0

@onready var power_label = $power_label

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Holding Dash (charging)
	if Input.is_action_pressed("Dash") and charge_power <= 100:
		charge_power += 50 * delta
		power_label.text = str(int(charge_power)) + "%"
	
	# Just released Dash
	elif Input.is_action_just_released("Dash"):
		print("Released Dash with power:", int(charge_power))
		# Do something with charge_power here (like a dash burst)
		charge_power = 0
		power_label.text = "0%"

	# Movement
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
