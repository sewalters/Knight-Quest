extends Area2D
@onready var timer = $Timer
@onready var death_sfx = $death_sfx

func _on_body_entered(body):
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	body.get_node("AnimatedSprite2D").play("death")
	death_sfx.play()
	timer.start()
	


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
