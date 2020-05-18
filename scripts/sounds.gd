extends Node

var path = "res://assets/audio/"
var death_sound = "death_sound.wav"
var car_drive_away = "car-driveaway.wav"
var paper_snatch = "paper_snatch.wav"

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
