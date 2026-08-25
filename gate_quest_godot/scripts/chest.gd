extends Node2D

@export var item_data: ItemData

@onready var chest_sprite: AnimatedSprite2D = $ChestSprite
@onready var chest_open_sound: AudioStreamPlayer2D = $ChestOpenSound
@onready var item_sprite: Sprite2D = $ItemSprite
@onready var item_animation: AnimationPlayer = $ItemAnimation


func _on_interactable_interacted() -> void:
	chest_sprite.play("open")
	chest_open_sound.play()
	item_animation.play("item_reveal")

	if item_data != null:
		item_sprite.texture = item_data.texture
		GameManager.inventory.add_item(item_data)
	pass
