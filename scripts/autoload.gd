extends Node

var current_scene
var current_level
var level_list
var level_path = "res://scenes/levels/"

func _ready():
	level_list = list_files_in_directory(level_path)
	print(level_list)
	pass

func _process(delta):
	pass
	
func game_over(scene):
	current_level = level_list.find(scene.name)
	current_scene = scene
	get_tree().change_scene("res://scenes/screens/GameOver/GameOver.tscn")
	pass

func round_win(scene):
	current_level = level_list.find(scene.name)
	current_scene = scene
	if current_level+1 == level_list.size():
		get_tree().change_scene("res://scenes/screens/GameCompleted/GameCompleted.tscn")
	else:
		get_tree().change_scene("res://scenes/screens/RoundWin/RoundWin.tscn")
	pass

func next_round():
	var to_load_name = level_list[current_level+1]
	var to_load_scene = level_path+to_load_name+"/"+to_load_name+".tscn"
	current_level += 1
	get_tree().change_scene(to_load_scene)
	pass

func try_again():
	var to_load_name = level_list[current_level]
	var to_load_scene = level_path+to_load_name+"/"+to_load_name+".tscn"
	current_level += 1
	get_tree().change_scene(to_load_scene)
	pass

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and file.find("Test_level"):
			files.append(file)
	dir.list_dir_end()
	return files
