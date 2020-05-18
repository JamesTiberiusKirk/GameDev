extends Level

func _process(delta):
	update_HUD()
	check_objective()

func check_objective():
	if AI_ammount <= 0:
		HudController.objective_complete = true

func update_HUD():
	HudController.total_enemies = AI_total
	HudController.enemies_left = AI_ammount
	HudController.is_doc_retrieval = false
