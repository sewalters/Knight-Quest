class_name Attack
extends Node

var attack_damage: float
var knockback_force: float # Maybe do knockback?
var attack_position: Vector2 # Keep track of attack position? Maybe not necessary.
var can_attack = true # Allows the player to attack one strike at a time.

func _ready():
	$Sword.hide()
	can_attack = true


func _process(delta):
	if can_attack == true:
		if Input.is_action_just_pressed("attack"):
			print("swish!")
			can_attack = false
			$Sword.show()
			$AttackTimer.start()


func _on_attack_timer_timeout():
	$Sword.hide()
	can_attack = true
