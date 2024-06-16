extends Area2D
class_name HitboxComponent

# Each hitbox instance will need to be provided a HealthComponent
# to damage.
@export var health_component : HealthComponent
@onready var hp = $"../HealthComponent"

func damage(attack : Attack):
	if health_component:
		health_component.damage(attack)
	else:
		hp.damage(attack)


func _on_health_component_damage_dealt():
	print("im hit")

