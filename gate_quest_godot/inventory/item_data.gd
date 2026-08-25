extends Resource
class_name ItemData

@export var name: String
@export_multiline var description: String
@export var texture: AtlasTexture
@export var is_stackable: bool

@export var is_consumable: bool
@export var consume_health_gain: int
