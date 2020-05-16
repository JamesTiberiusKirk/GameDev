extends Control

func _ready():
	var level_list = Autoload.list_files_in_directory("res://scenes/levels/")
	var button_list_box = $LevelSelect
	for level in level_list:
		var new_button = Button.new()
		new_button.text = level
		new_button.flat = true
		new_button.set_text_align(0)
		new_button.connect("pressed", self, "_select_level", [level])
		button_list_box.add_child(new_button)

func _select_level(obj):
	print(obj)
	get_tree().change_scene("res://scenes/levels/"+obj+"/"+obj+".tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://scenes/screens/MainMenu/MainMenu.tscn")

func _on_TestLevel_pressed():
	get_tree().change_scene("res://scenes/levels/Test_level/TestLevel.tscn")
