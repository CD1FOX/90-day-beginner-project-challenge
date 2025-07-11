extends Area2D

@export var speed: float = 500
@export var lifetime: float = 2.0
var velocity = Vector2.ZERO

func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta: float) -> void:
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Enemy":
		body.queue_free()
		queue_free()
