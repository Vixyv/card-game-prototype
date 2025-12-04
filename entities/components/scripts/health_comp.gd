class_name HealthComp
extends Node
## Represents a health component for an entity.


## Signal emitted when health <= 0.
signal died

## Max health of the entity.
@export var MAX_HEATH: int
var health: int

## Calls queue_free() on parent when health <= 0.
@export var queue_free_on_death := true


func _ready() -> void:
	health = MAX_HEATH

## Increases health by `heal_amount`. Clamps health to <= MAX_HEALTH.
func heal(heal_amount: int):
	health += heal_amount
	
	if health > MAX_HEATH:
		health = MAX_HEATH

## Decreases health by `damage_amount`. Dies when health <= 0.
func damage(damage_amount: int):
	health -= damage_amount
	
	if health <= 0:
		_die()

func _die():
	died.emit()
	
	if queue_free_on_death:
		get_parent().queue_free()
