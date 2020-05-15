extends Node2D

var death_count = 0
export (int) var AI_ammount

func _ready():
	pass

func _on_actor_killed(obj):
	if obj.name == "Player":
		print("game over")
		# Game over screen
	else:
		death_count += 1
	
	if death_count >= AI_ammount:
		print("Level conplete")
		# Next level or Level select
		get_tree().change_scene("res://scenes/levels/LevelSelect/LevelSeclect.tscn")
