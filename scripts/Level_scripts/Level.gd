extends Node2D
class_name Level

# Script for all levels
var death_count = 0
var AI_ammount = 0
var AI_total = 0
var player
var can_play_car_sound= true
signal reset_HUD()

func _ready():
	AI_total = check_for_AI()
	AI_ammount = check_for_AI()
	
func _process(delta):
	AI_ammount = check_for_AI()
	get_player()
	if not get_car():
		if can_play_car_sound:
			can_play_car_sound = false
			Sounds.play_car_sound()
		reset_HUD()
		Autoload.round_win(self)
	if not player:
		reset_HUD()
		Autoload.game_over(self)

func reset_HUD():
	HudController.total_enemies = 0
	HudController.enemies_left = 0
	HudController.is_doc_retrieval = false
	HudController.objective_complete = false

func check_for_AI():
	var nodes = get_children()
	var ammount = 0
	for n in nodes:
		if not n.name.find("AI_"):
			ammount += 1
	return ammount

func get_player():
	var nodes = get_children()
	player = null
	for n in nodes:
		if  n.name == "Player":
			player = n

func get_car():
	var nodes = get_children()
	for n in nodes:
		if  n.name == "Car":
			return true
	return false


