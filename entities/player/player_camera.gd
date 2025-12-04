extends Camera2D


@export var player: Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# TODO: Add camera smoothing
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = player.position
