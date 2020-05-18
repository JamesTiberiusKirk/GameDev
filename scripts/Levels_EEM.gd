extends Node2D

# Script for Enemy Elimination Missions

var death_count = 0
var AI_ammount
var AI_total
var player

func _ready():
	AI_total = check_for_AI()

func _process(delta):
	AI_ammount = check_for_AI()
	get_player()
	update_HUD()
	
	if AI_ammount <= 0:
		reset_HUD()
		Autoload.round_win(self)
	if not player:
		reset_HUD()
		Autoload.game_over(self)
	
func check_for_AI():
	var nodes = get_children()
	var AI_ammount = 0
	for n in nodes:
		if not n.name.find("AI_"):
			AI_ammount += 1
	return AI_ammount

func get_player():
	var nodes = get_children()
	player = null
	for n in nodes:
		if  n.name == "Player":
			player = n

func update_HUD():
	HudController.total_enemies = AI_total
	HudController.enemies_left = AI_ammount
	HudController.is_doc_retrieval = false

func reset_HUD():
	HudController.total_enemies = null
	HudController.enemies_left = null
	HudController.is_doc_retrieval = false
