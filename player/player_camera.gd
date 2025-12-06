extends Camera2D


@export var player: Player
## Percentage to interpolate from the player position to the mouse position.
@export_range(0, 1) var mouse_interp_amount := 0.2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# TODO: Fix camera interp between player and mouse
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = lerp(player.position, get_global_mouse_position(), mouse_interp_amount)
	#position.x = smoothstep(player.position.x, get_global_mouse_position().x, mouse_interp_amount)
	#position.y = smoothstep(player.position.y, get_global_mouse_position().y, mouse_interp_amount)
