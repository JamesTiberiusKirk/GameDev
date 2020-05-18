extends Control

onready var music_timer = $MusicTimer

func _ready():
	music_timer.wait_time = 0.1
	music_timer.start()

func _on_MusicTimer_timeout():
	Sounds.play_main_menu_music()
	music_timer.stop()

func _on_NewGame_pressed():
	get_tree().change_scene("res://scenes/levels/Level1/Level1.tscn")

func _on_ChooseLevel_pressed():
	get_tree().change_scene("res://scenes/screens/LevelSelect/LevelSeclect.tscn")

func _on_Exit_pressed():
	get_tree().quit()
