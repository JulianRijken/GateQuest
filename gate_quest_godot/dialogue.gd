extends Resource
class_name Dialogue

@export var text : String
@export var audio : AudioStream

# Characters Per Second
@export var typing_speed : float = 12

# If empty, option is not available
@export var option_a_text : String
@export var option_b_text : String
@export var option_c_text : String
