extends Node2D

@onready var break_animation: AnimationPlayer = $BreakAnimation

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Player:
		if body.position.y < position.y:
			break_animation.play("break_animation")
			print("Break!")
	
	
	
	print("Entered")
