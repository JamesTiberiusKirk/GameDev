extends KinematicBody2D
class_name Actor

const MAX_SPEED = 5000
const ACCELERATION = 10000

#var speed = 0
var direction: = Vector2()
var motion = Vector2.ZERO

func _physics_process(delta):
	
	if direction == Vector2.ZERO:
		apply_stopping_friction(ACCELERATION * delta)
	else:
		apply_acceleration(direction * ACCELERATION * delta)
	
	motion = move_and_slide(motion)
	

func apply_direction(dir):
	direction = dir

func apply_acceleration(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	

func apply_stopping_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else: 
		motion = Vector2.ZERO

#func move_actor():
#s	motion = move_and_slide(motion)

func look_at(look_vec):
	global_rotation = atan2(look_vec.y, look_vec.x)
