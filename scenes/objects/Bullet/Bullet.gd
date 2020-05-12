extends KinematicBody2D

const BOUNCE_LIMIT = 3

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
			if bounce_count < BOUNCE_LIMIT:
				# To bounce bullets off walls
				velocity = velocity.bounce(collision.normal)
				bounce_count += 1
			else:
				queue_free()

func fire(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

