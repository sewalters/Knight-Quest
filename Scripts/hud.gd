extends CanvasLayer
var current_health

const HP_3 = preload("res://Assets/sprites/health meter/hp_3.png")
const HP_2 = preload("res://Assets/sprites/health meter/hp_2.png")
const HP_1 = preload("res://Assets/sprites/health meter/hp_1.png")
const HP_0 = preload("res://Assets/sprites/health meter/hp_0.png")


#enum HP {HP_3, HP_2, HP_1, HP_0}
#var hp = HP.HP_3

@onready var hearts = $Hearts

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_health_component_damage_dealt(health):
	current_health = health
	#current_health -= 1
	if current_health == 3:
		hearts.texture = HP_3
	if current_health == 2:
		hearts.texture = HP_2
	if current_health == 1:
		hearts.texture = HP_1
	if current_health == 0:
		hearts.texture = HP_0
