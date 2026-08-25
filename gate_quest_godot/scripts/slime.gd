extends Node2D

@export var move_speed: float

@onready var left_cast: RayCast2D = $LeftCast
@onready var right_cast: RayCast2D = $RightCast
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction: int = 1

func _process(delta: float) -> void:
	if right_cast.is_colliding():
		direction = -1
		sprite.flip_h = true
	
	if left_cast.is_colliding():
		direction = 1
		sprite.flip_h = false
		
	position.x += direction * move_speed * delta
