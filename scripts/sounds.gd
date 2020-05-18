extends Node

var path = "res://assets/audio/"
var death_sound = "death_sound.wav"
var car_drive_away = "car-driveaway.wav"
var paper_snatch = "paper_snatch.wav"

var main_menu_music = "main_menu.wav"
var combat_music = "odisse_iam_morte.wav"

onready var background_music = AudioStreamPlayer.new()
onready var combat_music_player = AudioStreamPlayer.new()

var is_compat_music_playing = false
var is_main_menu_music_playing = false

func play_combat_music():
	if is_main_menu_music_playing:
		stop_main_menu_music()
	if is_compat_music_playing:
		return
	is_compat_music_playing = true
	var music = load(path+combat_music)
	combat_music_player.stream = music
	combat_music_player.volume_db = -30
	get_tree().get_root().add_child(combat_music_player)
	combat_music_player.play()

func stop_combat_music():
	is_compat_music_playing = false
	combat_music_player.stop()

func play_main_menu_music():
	if is_compat_music_playing:
		stop_combat_music()
	if is_main_menu_music_playing:
		return
	is_main_menu_music_playing = true
	var music = load(path+main_menu_music)
	background_music.stream = music
	background_music.volume_db = -25
	get_tree().get_root().add_child(background_music)
	background_music.play()

func stop_main_menu_music():
	is_main_menu_music_playing = false
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
