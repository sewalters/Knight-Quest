extends Node2D

@onready var weapon = $Weapon
@onready var attack_timer = $AttackTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	weapon.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_left"):
		scale.x = -1
	elif Input.is_action_just_pressed("move_right"):
		scale.x = 1
		
	if Input.is_action_just_pressed("attack"):
		weapon.show()
		attack_timer.start()

func _on_attack_timer_timeout():
	weapon.hide()
