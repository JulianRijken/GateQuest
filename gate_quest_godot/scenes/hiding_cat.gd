extends RigidBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cat_meow_steam: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var rotate_point: Node2D = $RotatePoint
@onready var falling_sound_player: AudioStreamPlayer2D = $FallingSoundPlayer

@export var hide_speed: float = -0.15
@export var show_speed: float = 1.5
@export var meow_sound_threshold: float = 0.5
@export var falling_rotate_speed: float = 360 * 5

var rotate_speed

func _process(delta: float) -> void:
	
	var speed = linear_velocity.length()
	if speed > 30:
		rotate_speed += falling_rotate_speed * delta
		rotate_point.rotation_degrees += rotate_speed * delta
		if falling_sound_player.playing == false:
			falling_sound_player.play()
	else:
		rotate_speed = 0
		falling_sound_player.stop()

func _on_interactable_exited() -> void:
	animation_player.play("cat_hide", -1, hide_speed, true)

func _on_interactable_entered() -> void:
	animation_player.play("cat_hide", -1, show_speed)
	
	var animation_alpha = animation_player.current_animation_position / animation_player.current_animation_length
	if animation_alpha < meow_sound_threshold:
		cat_meow_steam.play()
