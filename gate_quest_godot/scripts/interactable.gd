extends Area2D
class_name Interactable

@onready var show_animation: AnimationPlayer = $ShowAnimation
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var no_item_sound: AudioStreamPlayer2D = $NoItemSound

@export var is_interactable: bool = true

@export var required_item: ItemData

@onready var label_ui: Label = $Info/Label
@onready var item_ui: TextureRect = $Info/ItemContainer/Item


var in_area : bool = false
var body_in_area: Node2D

signal interacted
signal entered
signal exited

func _on_body_entered(body: Node2D) -> void:
	
	# Toggle UI
	if required_item != null:
		if GameManager.inventory.has_item(required_item):
			label_ui.visible = true
			item_ui.visible = false
		else: # Does not have the item
			label_ui.visible = false
			item_ui.visible = true
			item_ui.texture = required_item.texture
	else:
		label_ui.visible = true
		item_ui.visible = false

	# Play animation
	if is_interactable:
		show_animation.play("show_info")

	in_area = true
	body_in_area = body
	entered.emit()


func _on_body_exited(body: Node2D) -> void:
	if is_interactable:
		show_animation.play("show_info", -1, -1, true)
	in_area = false
	body_in_area = null
	exited.emit()

func _input(event: InputEvent) -> void:
	if is_interactable == false:
		return
	
	if in_area and event.is_action_pressed("Interact"):
		
		if required_item != null:
			if GameManager.inventory.try_remove_item(required_item) == false:
				no_item_sound.play()
				return
		
		collision_shape_2d.disabled = true
		show_animation.play("show_info", -1, -1, true)
		
		interacted.emit()
	
