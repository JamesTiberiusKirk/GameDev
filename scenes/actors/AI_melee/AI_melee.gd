extends Actor

export (int) var detect_radius = 450
export (float) var attack_delay
export (int) var patrol_delay

var vis_color = Color(.867, .91, .247, 0.1)
var hit_pos
var target
var t_last_known 
var velocity 
var last_position

var can_assign_last_pos = true
var can_attack = false
var can_patrol = false

onready var attack_timer = $AttackTimer
onready var health_bar = $HealthBar
onready var patrol_timer = $PatrolTimer

func _ready():
	var vision_shape = CircleShape2D.new()
	vision_shape.radius = detect_radius
	$Visibility/CollisionShape2D.shape = vision_shape
	max_speed = 100
	attack_timer.wait_time = attack_delay
	patrol_timer.wait_time = patrol_delay

func _physics_process(delta):
	update()
	health_bar.value = health

	if target:
		if is_in_LOS(target.position):
			t_last_known = target.position
			rotation = (target.position - position).angle()
			
			if can_assign_last_pos:
				last_position = position
				can_assign_last_pos = false
			
			move_to_global_pos(target.position)
		else:
			can_attack = false
	
	if t_last_known:
		if (t_last_known - position).length() <= 0.5:
			t_last_known = null
			#patrol_timer.start()
		else:
			move_to_global_pos(t_last_known)
	
	# Not finided yet
	if can_patrol and last_position and not target:
		if is_in_LOS(last_position):
			move_to_global_pos(last_position)
		if (last_position - position).length() <= 0.5:
			can_patrol = false
			can_assign_last_pos = true
			last_position = null

func _draw():
	# Visibility area
	draw_circle(Vector2(), detect_radius, vis_color)

func is_in_LOS(body) -> bool:
	# This function checks the line of sight to player
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, body, 
											[ self ], collision_mask)
	if result:
		hit_pos = result.position
		if result.collider.name == "Player":
			return true
	return false

func _on_Visibility_body_entered(body):
	if target:
		return
	target = body

func _on_Visibility_body_exited(body):
	target = null

func _on_AttackTimer_timeout():
	can_attack = true

func _on_PatrolTimer_timeout():
	#can_patrol = true
	pass
