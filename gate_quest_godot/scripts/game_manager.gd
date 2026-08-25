extends Node

@onready var label: Label = $CanvasLayer/Label
@onready var game_over_animation: AnimationPlayer = $GameOverAnimation
@onready var inventory_ui: InventoryUI  = $CanvasLayer/InventoryUI
@onready var inventory_animation: AnimationPlayer = $InventoryAnimation

@onready var scene_transition_fade: ColorRect = $CanvasLayer/SceneTransition/Fade

@export var inventory: InventoryData

var score: int = 0
var level_index: int = 0


func _unhandled_input(event: InputEvent) -> void:
	
	if Input.is_key_pressed(KEY_P):
		const ITEM_COIN = preload("uid://bb6idrcywte3y")
		inventory.add_item(ITEM_COIN)
	
	if Input.is_key_pressed(KEY_4):
		load_level_transition(1)
		
	if Input.is_key_pressed(KEY_O):
		const ITEM_CUP_OF_TEA = preload("uid://dc3auqaseylpw")
		inventory.add_item(ITEM_CUP_OF_TEA)
	
	if Input.is_action_just_pressed("open_inventory"):
		if game_over_animation.is_playing() == false:
			if inventory_ui.visible == false:
				inventory_animation.play("open_inventory")
				get_tree().paused = true
				inventory_ui.update(inventory);
			else:
				inventory_animation.play("close_inventory")
				get_tree().paused = false

func _on_timer_timeout() -> void:
	restart_game()


func load_level(level: int) -> void:
	level_index = level
	match level:
		0:
			get_tree().change_scene_to_file("res://scenes/levels/level_intro.tscn")	
		1:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")	
		2:
			get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")	

func load_level_transition(level: int) -> void:
	var transition_tween = create_tween()
	transition_tween.set_trans(Tween.TRANS_SINE)
	transition_tween.tween_property(scene_transition_fade, "color", Color(0,0,0,1), 1)
	transition_tween.tween_callback(load_level.bind(level)) 
	transition_tween.tween_property(scene_transition_fade, "color", Color(0,0,0,0), 1)

func load_next_level_transition() -> void:
	load_level_transition(level_index + 1)

func game_over():
	game_over_animation.stop()
	game_over_animation.play("game_over")

func restart_game():
	get_tree().reload_current_scene()
	reset_score()
	inventory.clear_items()

func add_score(ammount = 1):
	score += ammount
	update_score_ui()

func reset_score():
	score = 0
	update_score_ui()

func update_score_ui():
	label.text = "Coins: " + str(score)

func player_died():
	game_over()
