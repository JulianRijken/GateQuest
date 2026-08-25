extends Area2D

@export var damage: int = 100

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.do_damage(100)
