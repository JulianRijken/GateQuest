extends Node2D


func _on_play_button_pressed() -> void:
	GameManager.load_level_transition(1)

#func _on_invetory_button_pressed() -> void:
	#GameManager.open_inventory(true)
