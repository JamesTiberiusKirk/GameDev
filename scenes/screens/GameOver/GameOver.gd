extends Control


func _ready():
	pass




func _on_TryAgain_pressed():
	Autoload.try_again()
	pass


func _on_MainMenu_pressed():
	get_tree().change_scene("res://scenes/screens/MainMenu/MainMenu.tscn")
