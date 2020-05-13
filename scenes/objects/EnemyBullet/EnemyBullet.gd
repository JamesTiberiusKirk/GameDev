extends KinematicBody2D

var speed = 800
var velocity = Vector2()
var bounce_count = 0

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("deal_dmg"):
			collision.collider.deal_dmg()
			queue_free()
		else:
			queue_free()

func fire(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

