extends Area2D
class_name HitboxComponent

# Each hitbox instance will need to be provided a HealthComponent
# to damage.
@export var health_component : HealthComponent

func damage(attack : Attack):
	if health_component:
		health_component.damage(attack)
