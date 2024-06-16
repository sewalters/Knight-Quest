extends Area2D
@onready var purpleslime = $purpleslime


func _process(delta):
	pass
	
	
func _on_body_entered(body):
	if purpleslime:
		purpleslime.player = body
	


func _on_body_exited(body):
	if purpleslime:
		purpleslime.player = null
	


func _on_purpleslime_tree_exited():
	set_monitoring(false)
	queue_free()
