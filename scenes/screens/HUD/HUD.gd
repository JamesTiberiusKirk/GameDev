extends MarginContainer


onready var enemy_count_lable = $CanvasLayer/EnemyCount

func _ready():
	pass
	
func _process(delta):
	var txt = "Enemies:{l}/{t}"
	enemy_count_lable.text = txt.format({"l":HudController.enemies_left, 
										"t":HudController.total_enemies})
