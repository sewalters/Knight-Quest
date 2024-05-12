extends Area2D
@export var heal = 1

# Emit this signal when the fruit is picked up.
signal eat_fruit

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("spin")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# On collision with the player.
func _on_body_entered(body):
	eat_fruit.emit()
	queue_free()
	var attack = Attack.new()
	attack.attack_damage = heal
	body.get_node("HealthComponent").heal(attack)

