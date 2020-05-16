extends Node

var path = "res://assets/audio/"
var death_sound = "death_sound.wav"

func _ready():
	pass 
	
func play_death_sound():
	var sound = AudioStreamPlayer2D.new()
	var sfx = load(path+death_sound)
	sound.stream = sfx
	get_tree().get_root().add_child(sound)
	sound.play()
	pass
