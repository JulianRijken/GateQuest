extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var light: PointLight2D = $PointLight2D

var light_tween

func _on_reveal_area_body_entered(body: Node2D) -> void:
	if body is Player:
		animation_player.play("reveal_cave")


func _on_reveal_area_body_exited(body: Node2D) -> void:
	if body is Player:
		animation_player.play("reveal_cave", -1, -1, true)

func _on_light_reveal_body_entered(body: Node2D) -> void:
	if body is Player:
		light_tween = create_tween()
		light_tween.set_trans(Tween.TRANS_BOUNCE)
		light_tween.tween_property(light,"energy", 1.5, 4)

func _on_light_reveal_body_exited(body: Node2D) -> void:
	if body is Player:
		light_tween = create_tween()
		light_tween.set_trans(Tween.TRANS_BOUNCE)
		light_tween.tween_property(light, "energy", 0, 4)
