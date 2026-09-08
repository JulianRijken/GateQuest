extends Node
const DUCK = preload("uid://budq36cbadf5k")


func _ready() -> void:

	Engine.time_scale = 3
		
	var sprites := get_tree().current_scene.find_children("*", "Sprite2D")
	print("sprites " + str(sprites.size()))

	for sprite : Sprite2D in sprites:
		# await get_tree().create_timer(0.5).timeout
		sprite.texture = DUCK

	var animatedSprites := get_tree().current_scene.find_children("*", "AnimatedSprite2D")
	for animatedSprite : AnimatedSprite2D in animatedSprites:
		animatedSprite.speed_scale = 100

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

	# virus_on_death()


func _process(delta: float) -> void:
	for nummer in 10:
		print("Hello i am ducky virus catch me if you can")


	
		# print ("Hello i am ducky virus catch me if you can")
