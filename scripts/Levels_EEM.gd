extends Node2D

# Script for Enemy Elimination Missions

var death_count = 0
var AI_ammount
var player

func _process(delta):
	check_for_AI()
	get_player()
	
	if AI_ammount <= 0:
		Autoload.round_win(self)
	if not player:
		print("gameover")
		Autoload.game_over(self)
	
func check_for_AI():
	var nodes = get_children()
	AI_ammount = 0
	for n in nodes:
		if not n.name.find("AI_"):
			AI_ammount += 1

func get_player():
	var nodes = get_children()
	player = null
	for n in nodes:
		if  n.name == "Player":
			player = n
