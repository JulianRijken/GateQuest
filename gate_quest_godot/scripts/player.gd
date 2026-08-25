class_name Player
extends CharacterBody2D

signal died

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var rng = RandomNumberGenerator.new()

var is_dead: bool = false

var force_walk: bool = false

@export var death_slow_down_speed: float = 400

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var death_sound: AudioStreamPlayer2D = $DeathSound


func do_damage(damage: int) -> void:
	if is_dead == true:
		return 
	kill();


func kill():
	sprite.play("dying")
	is_dead = true
	died.emit()
	death_sound.play()
	GameManager.player_died()
	
	
#func _input(event: InputEvent) -> void:
	#print(event)

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_dead == true:
		velocity.x = move_toward(velocity.x, 0.0, delta * death_slow_down_speed);
		move_and_slide()
		return


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.pitch_scale = rng.randf_range(0.8, 1.2)
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	if force_walk:
		direction = 0.4
	
	#make him roll
	#if Input.is_action_just_pressed("roll"):
		#sprite.play("roll")
	
	
	# Flip sprite to direction
	if direction > 0:
		sprite.flip_h = false
	if direction < 0:
		sprite.flip_h = true
	
	# Animate player
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("walk")
	else:
		sprite.play("jump")
	
	# Apply input to velocity
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
