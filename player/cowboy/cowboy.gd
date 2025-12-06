class_name Cowboy
extends Player


@export var revolver: Revolver


func _ready() -> void:
	move_child(sprite, 0) # Moves sprite to ensure correct revolver placement

func _facing_b() -> void:
	animation_player.play("b_idle")
	move_child(revolver, 0) # Draws revolver behind sprite
	
func _facing_br() -> void:
	animation_player.play("br_idle")
	move_child(revolver, 0)
	
func _facing_f() -> void:
	animation_player.play("f_idle")
	move_child(revolver, 1) # Draws revolver infront of sprite
	
func _facing_fr() -> void:
	animation_player.play("fr_idle")
	move_child(revolver, 1)


func _handle_player_input() -> void:
	super()
	# TODO: Handling shooting and reloading
