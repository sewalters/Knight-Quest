extends AnimatedSprite2D
@onready var checkpoint_flag = $"."
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
var wasTouched = false


func _on_area_2d_body_entered(body):
	if wasTouched == false:
		audio_stream_player_2d.play()
		checkpoint_flag.play("flag raise")
		wasTouched = true
	

func _on_animation_finished():
	checkpoint_flag.play("flag up")
