class_name CowboyStats
extends EntityStats


@export_group("Revolver")
@export var base_damage: float = 10.0
@export var base_magazine_capacity: int = 6
## Time between attacks (in seconds).
@export var base_attack_interval: float = 0.5
## Time to reload magazine (in seconds).
@export var base_reload_time: float = 1.0

var cur_damage: float = 10.0
var cur_magazine_capacity: int = 6
var cur_attack_interval: float = 0.5
var cur_reload_time: float = 1.0

# Time remaining before the revolver can be shot
var attack_cooldown_time: float = 0.0 
var reload_cooldown_time: float = 0.0

# The amount of bullets currently in the magazine
var magazine: int = 0


func _setup_local_to_scene() -> void:
	super()
	magazine = base_magazine_capacity
