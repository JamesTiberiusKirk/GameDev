extends Node

var path = "res://assets/audio/"
var death_sound = "death_sound.wav"
var car_drive_away = "car-driveaway.wav"
var paper_snatch = "paper_snatch.wav"

var main_menu_music = "main_menu.wav"
var combat_music = ""

onready var background_music = AudioStreamPlayer.new()
onready var combat_music_player = AudioStreamPlayer2D.new()

func play_combat_music():
	var music = load(path+combat_music)
	combat_music_player.stream = music
	combat_music_player.volume_db = -25
	get_tree().get_root().add_child(combat_music_player)
	combat_music_player.play()

func stop_combat_music():
	combat_music_player.stop()

func play_main_menu_music():

	var music = load(path+main_menu_music)
	background_music.stream = music
	background_music.volume_db = -25
	get_tree().get_root().add_child(background_music)
	background_music.play()

func stop_main_menu_music():
	background_music.stop()

func play_death_sound():
	var sound = AudioStreamPlayer2D.new()
	var sfx = load(path+death_sound)
	sound.stream = sfx
	get_tree().get_root().add_child(sound)
	sound.play()
	pass

func play_paper_snatch_sound():
	var sound = AudioStreamPlayer2D.new()
	var sfx = load(path+paper_snatch)
	sound.stream = sfx
	get_tree().get_root().add_child(sound)
	sound.play()
	pass

func play_car_sound():
	var sound = AudioStreamPlayer2D.new()
	var sfx = load(path+car_drive_away)
	sound.stream = sfx
	get_tree().get_root().add_child(sound)
	sound.play()
	pass
