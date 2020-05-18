extends MarginContainer

onready var canvas  = $CanvasLayer
onready var enemy_count_lable = $CanvasLayer/EnemyCount
onready var health_bar = $CanvasLayer/HealthBar
onready var health_info = $CanvasLayer/HealthInfo
onready var doc_info = $CanvasLayer/DocInf
onready var doc_node = $CanvasLayer/DocNode
onready var return_notif = $CanvasLayer/ReturnNotifier

onready var doc_texture = load("res://assets/objects/Documents.png")

func _ready():
	pass
	
func _process(delta):
	update_enemy_lable()
	update_health()
	if HudController.is_doc_retrieval:
		update_doc_info()
	if HudController.objective_complete:
		update_obj_notifier()

func update_enemy_lable():
	var txt = "Enemies:{l}/{t}"
	enemy_count_lable.text = txt.format({"l":HudController.enemies_left, 
										"t":HudController.total_enemies})

func update_obj_notifier():
	return_notif.text = "Objective Complete, Return to Car"

func update_health():
	health_bar.value = HudController.health
	var hl = "Health: {h}/100"
	health_info.text = hl.format({"h":HudController.health})

func update_doc_info():
	if HudController.doc_picked_up:
		HudController.doc_picked_up = false
		doc_info.text = "Document Aquired"
		return_notif.text = "Mission Complete, Return to Car"
		var sprite = Sprite.new()
		sprite.set_texture(doc_texture)
		doc_node.scale = Vector2(0.1,0.1)
		doc_node.add_child(sprite)
	else:
		doc_info.text = "Aquire Document"
