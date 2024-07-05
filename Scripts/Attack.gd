class_name Attack
extends Node2D

var attack_damage = 1
var knockback_force: float # Maybe do knockback?
var attack_position: Vector2 # Keep track of attack position? Maybe not necessary.
var can_attack = true # Allows the player to attack one strike at a time.

func _ready():
	$Sword.hide()
	$HurtboxComponent.set_monitoring(false)
	can_attack = true


func _process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction == -1:
		scale.x = -1
	elif direction == 1:
		scale.x = 1
	
	if can_attack == true:
		if Input.is_action_just_pressed("attack"):
			$HurtboxComponent.set_monitoring(true)
			can_attack = false
			$Sword.show()
			$AttackTimer.start()


func _on_attack_timer_timeout():
	$Sword.hide()
	$HurtboxComponent.set_monitoring(false)
	can_attack = true


func _on_hurtbox_component_area_entered(area):
	print("swish!")
	
