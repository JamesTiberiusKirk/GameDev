extends KinematicBody2D

func _on_Body_body_entered(body):
	if body.name == "Player":
		HudController.doc_picked_up = true
		queue_free()
