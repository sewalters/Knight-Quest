extends Node

@export var winText: PackedScene
@export var coin_goal = 100
var score = 0

func add_point():
	score += 1
	print(score)
	
	if score >= coin_goal:
		print("You Win!")
		var winScreen = winText.instantiate()
		add_child(winScreen)
		
