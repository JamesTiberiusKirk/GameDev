extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Back_pressed():
	get_tree().change_scene("res://scenes/screens/MainMenu/MainMenu.tscn")

func _on_TestLevel_pressed():
	get_tree().change_scene("res://scenes/levels/Test_level/TestLevel.tscn")



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/levels/Level1/Level1.tscn")