extends Node2D

var death_count = 0
export (int) var AI_ammount

func _ready():
	pass

func _on_actor_killed(obj):
	if obj.name == "Player":
		print("game over")
		Autoload.game_over(self)
	else:
		death_count += 1
	
	if death_count >= AI_ammount:
		print("lvl1 complete")
		# Next level or Level select
		Autoload.round_win(self)