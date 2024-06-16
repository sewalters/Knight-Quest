extends Area2D
class_name HurtboxComponent

@export var attack_damage := 1
@export var knockback_force := 0


func _on_area_entered(area : HitboxComponent):
	print("hurt!")
	var attack = Attack.new()
	attack.attack_damage = attack_damage
	attack.knockback_force = knockback_force
	attack.attack_position = global_position
	
	area.damage(attack)

