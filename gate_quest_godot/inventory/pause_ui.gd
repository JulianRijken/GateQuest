extends Control
class_name PauseUI


func _on_play_button_pressed() -> void:
	GameManager.pause_game(false)


func _on_main_menu_button_pressed() -> void:
	GameManager.load_level_transition(0)
