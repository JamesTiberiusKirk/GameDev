extends KinematicBody2D
class_name Actor

const MAX_SPEED = 10000
const ACCELERATION = 10000

#var direction: = Vector2()
#var speed = 0
var motion = Vector2.ZERO

func move_actor(velocity):
	return move_and_slide(velocity)
	
	
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	
	
func look_at(look_vec):
	global_rotation = atan2(look_vec.y, look_vec.x)

func apply_friction(amount):
	if self.motion.length() > amount:
		self.motion -= self.motion.normalized() * amount
	else: 
		self.motion = Vector2.ZERO
	
