class_name Revolver
extends Node2D
## The Cowboy's revolver (by default, it is facing right, +x).


@export var damage := 10
@export var magazine_capacity := 6
## Time between attacks (in seconds).
@export var attack_interval := 0.5
## Time to reload magazine (in seconds).
@export var reload_time := 1.0

# Time remaining before the revolver can be shot
var attack_cooldown_time := 0.0 
var reload_cooldown_time := 0.0

# The amount of bullets currently in the magazine
var magazine: int


func _ready() -> void:
	magazine = magazine_capacity

func _process(delta: float) -> void:
	if attack_cooldown_time > 0:
		attack_cooldown_time -= delta
	if reload_cooldown_time > 0:
		reload_cooldown_time -= delta


func shoot() -> void:
	if attack_cooldown_time <= 0 and reload_cooldown_time <= 0:
		spawn_bullet()
		attack_cooldown_time = attack_interval

# TODO: Implement bullets
func spawn_bullet() -> void:
	pass
	
func reload() -> void:
	if magazine <= magazine_capacity:
		magazine = magazine_capacity
		reload_cooldown_time = reload_time
