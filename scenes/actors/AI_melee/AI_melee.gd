extends Actor

export (int) var detect_radius
export (float) var attack_delay

var vis_color = Color(.867, .91, .247, 0.1)
var hit_pos
var target
var t_last_known 
var velocity 
var can_attack = false

onready var attack_timer = $AttackTimer
onready var health_bar = $HealthBar

func _ready():
	var vision_shape = CircleShape2D.new()
	vision_shape.radius = detect_radius
	$Visibility/CollisionShape2D.shape = vision_shape
	max_speed = 100
	attack_timer.wait_time = attack_delay
	

func _physics_process(delta):
	update()
	# if there's a target, rotate towards it and attack
	if target:
		if is_in_LOS(target.position):
			t_last_known = target.position
			rotation = (target.position - position).angle()
			attack(target.position)
		else:
			can_attack = false
	if t_last_known:
		if (t_last_known-position).length() <= 0.5:
			t_last_known = null
		else:
			move_to_global_pos(t_last_known)

func attack(pos):
	move_to_global_pos(target.position)

func _draw():
	# Visibility area
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
	if target:
		return
	target = body

func _on_Visibility_body_exited(body):
	target = null

func _on_AttackTimer_timeout():
	can_attack = true



