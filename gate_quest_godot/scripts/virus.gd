extends Node
const DUCK = preload("uid://budq36cbadf5k")


func _ready() -> void:

	# Engine.time_scale = 0

	var sprites := get_tree().current_scene.find_children("*", "Sprite2D")
	print("sprites " + str(sprites.size()))

	for sprite : Sprite2D in sprites:
		# print(sprite.name + " | " + sprite.get_parent().name + " | " + str(sprite.position) + " | " + str(sprite.texture))
		sprite.texture = DUCK

	var animatedSprites := get_tree().current_scene.find_children("*", "AnimatedSprite2D")
	print("animatedSprites " + str(animatedSprites.size()))
	for animatedSprite : AnimatedSprite2D in animatedSprites:
		print(animatedSprite.name + " | " + animatedSprite.get_parent().name + " | " + str(animatedSprite.position))
		animatedSprite.speed_scale = 100
		animatedSprite.flip_v = true


	# Find all tile map layers
	var tileMaps := get_tree().current_scene.find_children("*", "TileMapLayer")	
	print("tileMaps " + str(tileMaps.size()))	

	# Loop all tileMaps
	for tileMap : TileMapLayer in tileMaps:

		# Loop all tile map sources
		for i in tileMap.tile_set.get_source_count():

			# Set srouce texture atlas
			var source := tileMap.tile_set.get_source(i)
			if source is TileSetAtlasSource:
				source.texture = DUCK


	# # Change game over text to quack over
	# var labels := get_tree().root.find_children("*", "Label")
	# print("labels: " + str(labels.size()))
	# for label : Label in labels:
	# 	print(label.name + " | " + label.get_parent().name)

	print("Going over all nodes")
	print(get_tree().root.get_child_count())


	var nodes := get_tree().root.find_children("*", "Node")
	print("nodes: " + str(nodes.size()))
	for node : Node in nodes:
		print(node.name + " | " + node.get_parent().name)