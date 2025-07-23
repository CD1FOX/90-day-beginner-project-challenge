extends CharacterBody2D

var speed := 300

@onready var position_1 = $"../Left"
@onready var position_2 = $"../Right"
@onready var animation := $AnimatedSprite2D

var target_position: Vector2

func _ready() -> void:
	target_position = position_2.position
	animation.play("right")
	position = position_1.position

func _physics_process(_delta: float) -> void:
	var direction = (target_position - position).normalized()
	velocity = direction * speed
	move_and_slide()

	# If close enough to the target, switch
	if position.distance_to(target_position) < 5:
		if target_position == position_1.position:
			animation.play("right")
			target_position = position_2.position
		else:
			animation.play("left")
			target_position = position_1.position
