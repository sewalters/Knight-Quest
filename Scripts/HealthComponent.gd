extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10.0
var health : float

func _ready():
	health = MAX_HEALTH


func damage(attack: Attack):
	health -= attack.attack_damage
	print(health)
	
	if health <=0: 
		if get_parent().has_method("death"):
			get_parent().death() # If parent entity has special death behavior we want, call this
		else:
			get_parent().queue_free() # else, just remove entity

func heal(attack: Attack):
	health += attack.attack_damage
	
	if health > MAX_HEALTH:
		health = MAX_HEALTH
