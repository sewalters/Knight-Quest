extends Node

@export var TOTAL_COINS := 50
var score = 0

func add_point():
	score += 1
	print(score)
	
	if score >= TOTAL_COINS:
		print("You win! Resetting...") # This is where we process "Winning"
		get_tree().reload_current_scene()
	
