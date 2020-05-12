extends Actor
#extends KinematicBody2D

export (int) var detect_radius  # size of the visibility circle
export (float) var fire_rate  # delay time (s) between bullets

var vis_color = Color(.867, .91, .247, 0.1)
var hit_pos
var target
var t_last_known 
var velocity 

func _ready():
	# dim the sprite when not active

	# set the collision area's radius
	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	$Visibility/CollisionShape2D.shape = shape
	max_speed = 100
	

func _physics_process(delta):
	update()
	# if there's a target, rotate towards it and fire	
	if target:
		if is_in_LOS(target.position):
			t_last_known = target.position
			rotation = (target.position - position).angle()
			attack(target.position)
	elif t_last_known:
		move_to_global_pos(t_last_known)
		if (t_last_known-position).length() <= 0.5:
			t_last_known = null
		

func attack(pos):
	#run for the player 
	move_to_global_pos(target.position)

func _draw():
	# display the visibility area
	draw_circle(Vector2(), detect_radius, vis_color)

func is_in_LOS(body) -> bool:
	# This function checks the line of sight
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, body, 
											[ self ], collision_mask)
	
	if result:
		hit_pos = result.position
		if result.collider.name == "Player":
			return true
	
	return false

func _on_Visibility_body_entered(body):
	# connect this to the "body_entered" signal
	if target:
		return
	# Need to check if there is a clear line of sight 
	target = body
	

func _on_Visibility_body_exited(body):
	# connect this to the "body_exited" signal
	if body == target:
		target = null



