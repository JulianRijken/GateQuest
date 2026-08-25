extends Node2D

@onready var interactable: Interactable = $Interactable
@onready var gate: TileMapLayer = $Gate
@onready var gate_open_sound: AudioStreamPlayer2D = $GateOpenSound
@onready var walking_timer: Timer = $Timer

@export var starting_player: Player
@export var walk_distance: float = 80
@export var max_walk_duration: float = 6

func _ready() -> void:

	if starting_player == null:
		return

	# Move player to gate
	starting_player.position = position
		
	# Force walk player
	starting_player.force_walk = true
		
	# Disable gate collision
	gate.collision_enabled = false
	
	walking_timer.start(max_walk_duration)

func _process(delta: float) -> void:
	if walking_timer.is_stopped() == false:
		
		var distance_from_gate = starting_player.position.x - position.x
		if distance_from_gate > walk_distance:
			walking_timer.stop()
			walking_timer.timeout.emit()

func _on_interactable_interacted() -> void:
	
	# Play Sound
	gate_open_sound.play()
	
	# Disable gate collision
	gate.collision_enabled = false
	
	# Force walk player
	var player: Node2D = interactable.body_in_area
	if player is Player:
		player.force_walk = true
		
	# Transition to next level
	await get_tree().create_timer(1).timeout
	GameManager.load_next_level_transition()
	

func _on_timer_timeout() -> void:
	
	# Stop player walking
	starting_player.force_walk = false
	
	# Enable gate collision
	gate.collision_enabled = true
	
	pass
