class_name HitboxComp
extends Area2D
## Represents a hitbox component for an entity.
## Requires a CollisionShape2D to be added as a child of self.


@export var HEALTH_COMP: HealthComp


## Applies damage to `HEALTH_COMP`
func damage(attack: AttackComp):
	HEALTH_COMP.damage(attack.attack_damage)
