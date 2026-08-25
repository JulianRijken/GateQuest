extends Node2D
class_name NPC

@export var dialogue : Dialogue

func _on_interactable_interacted() -> void:
	DialogueSystem.talk(dialogue)
