extends Control

func _on_NewGame_pressed():
	get_tree().change_scene("res://scenes/levels/Level1/Level1.tscn")

func _on_ChooseLevel_pressed():
	get_tree().change_scene("res://scenes/screens/LevelSelect/LevelSeclect.tscn")

func _on_Exit_pressed():
	get_tree().quit()
