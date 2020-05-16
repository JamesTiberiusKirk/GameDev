extends KinematicBody2D
class_name Actor

signal actor_killed(obj)

var health = 100
var max_speed = 500
var acceleration = 5000

var direction: = Vector2()
var motion = Vector2.ZERO
var bounce_countdown = 0
var rng = RandomNumberGenerator.new()

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

func look_at(look_vec):
	global_rotation = atan2(look_vec.y, look_vec.x)

func deal_dmg(amount: int):
	health -= amount
	if health <= 0 :
		emit_signal("actor_killed", self)
		Sounds.play_death_sound()
		queue_free()
