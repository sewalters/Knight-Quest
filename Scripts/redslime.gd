extends Node2D
@export var SPEED = 100
var attack_damage = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hurtbox_component_area_entered(area):
	print("hurt!")
	var attack = Attack.new()
	attack.attack_damage = attack_damage
	attack.attack_position = global_position
	
	area.damage(attack)
