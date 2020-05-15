extends Control

func _on_NewGame_pressed():
	get_tree().change_scene("res://scenes/levels/Test_level/TestLevel.tscn")


func _on_ChooseLevel_pressed():
	get_tree().change_scene("res://scenes/levels/LevelSelect/LevelSeclect.tscn")


func _on_Exit_pressed():
	get_tree().quit()
