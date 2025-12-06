class_name Player
extends CharacterBody2D
## Base player script for any player character


## Speed in pixels per second.
@export var speed := 60
## DELETE LATER
@export var facing_dir_sprite: Sprite2D

@export var sprite := Sprite2D

const PI_DIV_2 = PI/2
## Degree range for which the sprite faces up or down (plus and minus)
@export var up_down_degree_range := 25.0
var up_down_rad_range: float

## Degree range for which the sprite back left or right (plus and minus).
## Up down range takes priority
@export var back_lr_degree_range := 50.0
var back_lr_rad_range: float

# 1 = facing right, -1 = facing left
# Can't use scale.x bc it resets to 1.0 for some reason??
var facing_dir := 1


func _ready() -> void:
	up_down_rad_range = deg_to_rad(up_down_degree_range)
	back_lr_rad_range = deg_to_rad(back_lr_degree_range)

func _process(_delta: float) -> void:
	_rotate_sprite()

func _rotate_sprite() -> void:
	# The facing dir of the player (l/r) changes the sign of `get_angle_to`
	var rot_to_mouse = sign(scale.y) * get_angle_to(get_global_mouse_position())
	var sign_of_rtm = sign(rot_to_mouse) if rot_to_mouse != 0 else 1
	
	## TODO: Replace rotations with sprite changes (facing state)
	if ( # When mouse is above or below
		rot_to_mouse < sign_of_rtm * PI_DIV_2 + up_down_rad_range and 
		rot_to_mouse > sign_of_rtm * PI_DIV_2 - up_down_rad_range
	):
		if rot_to_mouse < 0:
			facing_dir_sprite.rotation = -PI_DIV_2 # Looking forward (down)
		else:
			facing_dir_sprite.rotation = PI_DIV_2  # Looking back (up)
	elif ( # When mouse is above and further left or right
		rot_to_mouse < 0 and 
		rot_to_mouse < -PI_DIV_2 + back_lr_rad_range and 
		rot_to_mouse > -PI_DIV_2 - back_lr_rad_range
	):
		facing_dir_sprite.rotation = -PI/4 # Looking back right
		_flip_sprite(rot_to_mouse)
	else:
		facing_dir_sprite.rotation = PI/4  # Looking forward right
		_flip_sprite(rot_to_mouse)

func _flip_sprite(rot_to_mouse: float) -> void:
	if abs(rot_to_mouse) > PI_DIV_2 + up_down_rad_range:
		scale.x = -1


# TODO: Implement functionality for moving and rotating the revolver
func _physics_process(_delta: float) -> void:
	_handle_player_input()
	move_and_slide()

func _handle_player_input() -> void:
	_move_input()
	
func _move_input() -> void:
	var vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = vector * speed
