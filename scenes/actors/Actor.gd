extends KinematicBody2D
class_name Actor

var health = 100

var max_speed = 1000
var acceleration = 5000

var direction: = Vector2()
var motion = Vector2.ZERO

func _physics_process(delta):
	
	if direction == Vector2.ZERO:
		apply_stopping_friction(acceleration * delta)
	else:
		apply_acceleration(direction * acceleration * delta)
	
	motion = move_and_slide(motion)
	

func apply_direction(dir):
	direction = dir

func apply_acceleration(acc):
	motion += acc
	motion = motion.clamped(max_speed)
	

func apply_stopping_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else: 
		motion = Vector2.ZERO

#func move_to_global_pos(pos):
#	while get_global_position() != pos:
#		apply_acceleration(pos - )
		
func look_at(look_vec):
	global_rotation = atan2(look_vec.y, look_vec.x)

func deal_dmg():
	health -= 10
	if health <=0 :
		queue_free()
	
