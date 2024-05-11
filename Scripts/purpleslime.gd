extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player : Player

const SPEED = 60
var direction = 0

func _process(delta):
	if player:
		direction = (player.global_position - global_position).normalized()
		animated_sprite_2d.play("chase")
		if direction.x > 0:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true
		position.x += direction.x * SPEED * delta
		
	else:
		animated_sprite_2d.play("idle")
		

