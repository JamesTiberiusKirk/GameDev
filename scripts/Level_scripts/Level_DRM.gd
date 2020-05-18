extends Level

# Script for Document Retreival Missions

var can_play_doc_sound = true

func _process(delta):
	var doc = not check_for_doc() 
	update_HUD(doc)
	HudController.objective_complete = doc
	if can_play_doc_sound and doc:
		can_play_doc_sound = false
		Sounds.play_paper_snatch_sound()

func check_for_doc():
	var nodes = get_children()
	for n in nodes:
		if not n.name.find("Document"):
			return true
	return false
	

func update_HUD(dpu):
	HudController.total_enemies = AI_total
	HudController.enemies_left = AI_ammount
	HudController.is_doc_retrieval = true
	HudController.doc_picked_up = dpu
