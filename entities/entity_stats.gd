class_name EntityStats
extends Resource


signal health_changed(cur_health: int, max_health: int)
signal health_depleated

@export var base_max_health: float = 100.0
@export var base_speed: float = 60.0

var cur_max_health: float = 100.0
var cur_speed: float = 60.0

var health: float = 0.0: set = _health_depleated


func _setup_local_to_scene() -> void:
	health = cur_max_health

func _health_depleated(new_value: float) -> void:
	health = clampf(new_value, 0.0, cur_max_health)
	health_changed.emit(new_value, cur_max_health)
	if health <= 0:
		health_depleated.emit()
