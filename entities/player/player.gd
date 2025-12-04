class_name Player
extends CharacterBody2D
## Base player script for any player character


## Speed in pixels per second.
@export var speed := 60


# TODO: Implement functionality for moving and rotating the revolver
func _physics_process(_delta: float) -> void:
	_handle_player_input()
	move_and_slide()

func _handle_player_input() -> void:
	_move_input()
	
func _move_input() -> void:
	var vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = vector * speed
