class_name Attack
extends Node
@onready var weapon = $"."
@onready var sword = $Sword
@onready var hurtbox_component = $HurtboxComponent


var attack_damage: float
var knockback_force: float # Maybe do knockback?
var attack_position: Vector2 # Keep track of attack position? Maybe not necessary.
var can_attack = true # Allows the player to attack one strike at a time.

func _ready():
	can_attack = true
	hurtbox_component.set_monitoring(false)


func _process(delta):
	if can_attack == true:
		if Input.is_action_just_pressed("attack"):
			print("swish!")
			can_attack = false
			$Sword.show()
			hurtbox_component.set_monitoring(true)
			$AttackTimer.start()


func _on_attack_timer_timeout():
	hurtbox_component.set_monitoring(false)
	can_attack = true
