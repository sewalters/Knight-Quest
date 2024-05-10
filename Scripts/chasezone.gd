extends Area2D
@onready var purpleslime = $purpleslime


func _process(delta):
	pass
	
	
func _on_body_entered(body):
	
	purpleslime.direction = (body.global_position - purpleslime.global_position).normalized()
	purpleslime.SPEED = 60
	


func _on_body_exited(body):
	purpleslime.SPEED = 0
	
