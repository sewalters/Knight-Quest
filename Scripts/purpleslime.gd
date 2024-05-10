extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var SPEED = 0
var direction = 1

func _process(delta):
	if SPEED > 0:
		animated_sprite_2d.play("chase")
		if direction.x > 0:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true
		position.x += direction.x * SPEED * delta
	else:
		animated_sprite_2d.play("idle")
		
