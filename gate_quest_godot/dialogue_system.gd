extends Node2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var label: RichTextLabel = $CanvasLayer/MarginContainer/Panel/MarginContainer/RichTextLabel
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

# todo, play sound randomly
@export var type_sound : AudioStream

func _ready() -> void:
	canvas_layer.visible = false

func talk(dialogue: Dialogue) -> void:
	
	canvas_layer.visible = true
	label.clear()
	
	for i in dialogue.text.length():
		await get_tree().create_timer(1 / dialogue.typing_speed).timeout
		label.append_text(dialogue.text[i])
		audio.stream = type_sound
		audio.play()
