extends MarginContainer

var health
var enemies_left
var enemy_total

onready var enemy_count_lable = $CanvasLayer/EnemyCount
onready var node = get_parent()

func _ready():
	set_enemy_total(get_parent().AI_ammount)
	pass
	
func _process(delta):
	#if node:
	set_enemies_left(get_parent().death_count)
	var txt = "Enemies:{l}/{t}"
	enemy_count_lable.text = txt.format({"l":enemies_left, "t":enemy_total})

func set_enemies_left(amount):
	enemies_left = amount

func set_enemy_total(amount):
	enemy_total = amount
