extends Area2D

@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound
@onready var pickup_animation: AnimationPlayer = $PickupAnimation
@export var coin_item: ItemData

func _on_body_entered(_body: Node2D) -> void:
	#GameManager.add_score()
	GameManager.inventory.add_item(coin_item)
	pickup_animation.play("coin_pickup")
	#pickup_sound.play()
	#queue_free()
