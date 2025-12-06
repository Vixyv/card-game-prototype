class_name Revolver
extends Node2D
## The Cowboy's revolver (by default, it is facing right, +x).


@onready var stats: CowboyStats = (get_parent() as Cowboy).stats

# Time remaining before the revolver can be shot
var attack_cooldown_time: float = 0.0 
var reload_cooldown_time: float = 0.0

# The amount of bullets currently in the magazine
var magazine: int = 0


func _ready() -> void:
	magazine = stats.cur_magazine_capacity

func _process(delta: float) -> void:
	if attack_cooldown_time > 0:
		attack_cooldown_time -= delta
	if reload_cooldown_time > 0:
		reload_cooldown_time -= delta
	
	# Rotates to point at mouse
	look_at(get_global_mouse_position())
	


func shoot() -> void:
	if attack_cooldown_time <= 0 and reload_cooldown_time <= 0:
		spawn_bullet()
		attack_cooldown_time = stats.cur_attack_interval

# TODO: Implement bullets
func spawn_bullet() -> void:
	pass
	
func reload() -> void:
	if magazine <= stats.cur_magazine_capacity:
		magazine = stats.cur_magazine_capacity
		reload_cooldown_time = stats.cur_reload_time
