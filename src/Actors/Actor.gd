extends KinematicBody2D

class_name Actor

#const TOP_RIGHT = Vector2(1,-1)
#const TOP_LEFT = Vector2(-1,-1)
#const LEFT_DOWN = Vector2(-1,1)
#const DOWN_RIGHT = Vector2(1,1)

#const TOP = Vector2(0,-1)
#const RIGHT = Vector2(1,0)
#const DOWN = Vector2(0,1)
#const LEFT = Vector2(-1,0)

const MAX_SPEED = 10000
const ACCELERATION = 10000

var direction: = Vector2()
var speed = 0
var motion = Vector2.ZERO


func _physics_process(delta: float):
	pass

func _ready():
	pass 

func move_actor(velocity):
	return move_and_slide(velocity)
	
	
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	
	
func look_at(look_vec):

	global_rotation = atan2(look_vec.y, look_vec.x)

