extends Node2D

const SPEED = 60
var direction = 1 # 1 for gith movement, -1 for left.
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	position.x += direction * SPEED * delta


func _on_hitbox_component_body_entered(body):
	print("ouch!")

func death():
	print("I'm dead")
	queue_free()


func _on_health_component_damage_dealt():
	pass # Replace with function body.
