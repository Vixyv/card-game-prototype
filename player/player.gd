class_name Player
extends CharacterBody2D
## Base player script for any player character


const PI_DIV_2: float = PI/2

## Speed in pixels per second.
@export var stats: EntityStats
@export var sprite: Sprite2D
@export var animation_player: AnimationPlayer

## Degree range for which the sprite faces forward or back (plus and minus)
@export_range(0, 89) var forw_back_degree_range: float = 25.0
@onready var forw_back_rad_range := deg_to_rad(forw_back_degree_range)

## Degree range for which the sprite back left or back right (plus and minus).
@export_range(0, 89) var back_lr_degree_range: float = 45.0
@onready var back_lr_rad_range := deg_to_rad(back_lr_degree_range)


func _process(_delta: float) -> void:
	_rotate_sprite()

# Rotates the sprite to one of four direction (f, fr, b, br) 
# depending on where the mouse is relative to the player
func _rotate_sprite() -> void:
	# The facing dir of the player (l/r) changes the sign of `get_angle_to()`
	var rot_to_mouse: float = sign(scale.y) * get_angle_to(get_global_mouse_position())
	var sign_of_rtm: int = sign(rot_to_mouse) if rot_to_mouse != 0 else 1
	
	if ( # When mouse is above or below
		rot_to_mouse < sign_of_rtm * PI_DIV_2 + forw_back_rad_range and 
		rot_to_mouse > sign_of_rtm * PI_DIV_2 - forw_back_rad_range
	):
		if rot_to_mouse < 0:
			_facing_b() # Back
		else:
			_facing_f() # Forward
	elif ( # When mouse is above and further left or right
		rot_to_mouse < 0 and 
		rot_to_mouse < -PI_DIV_2 + back_lr_rad_range and 
		rot_to_mouse > -PI_DIV_2 - back_lr_rad_range
	):
		_facing_br() # Back right
		_flip_player(rot_to_mouse)
	else:
		_facing_fr() # Forward right
		_flip_player(rot_to_mouse)

# Flips the whole player
func _flip_player(rot_to_mouse: float) -> void:
	if abs(rot_to_mouse) > PI_DIV_2 + forw_back_rad_range:
		scale.x = -1

#region Facing Functions (Implemented by Children)
func _facing_b() -> void:
	pass
	
func _facing_br() -> void:
	pass
	
func _facing_f() -> void:
	pass
	
func _facing_fr() -> void:
	pass
#endregion


func _physics_process(_delta: float) -> void:
	_handle_player_input()
	move_and_slide()

func _handle_player_input() -> void:
	_move_input()
	
func _move_input() -> void:
	var vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = vector * stats.cur_speed
	stats.cur_dne = 0
