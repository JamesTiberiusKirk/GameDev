extends Actor

export (float) var fire_rate#
export (int) var detect_radius

onready var shoot_timer = $ShootTimer
onready var health_bar = $HealthBar
onready var bullet = preload("res://scenes/objects/EnemyBullet/EnemyBullet.tscn")

var vis_color = Color(.867, .91, .247, 0.1)
var hit_pos
var target
var t_last_known 
var velocity 
var can_attack = true

func _ready():
	shoot_timer.wait_time = fire_rate

	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	$Visibility/Radius.shape = shape
	max_speed = 100


func _physics_process(delta):
	update()
	# if there's a target, rotate towards it and attack
	if target:
		if is_in_LOS(target.position):
			t_last_known = target.position
			rotation = (target.position - position).angle()
			attack(rotation)
		
	if t_last_known:
		if (t_last_known-position).length() <= 0.5:
			t_last_known = null
		else:
			move_to_global_pos(t_last_known)
	health_bar.value = health

func shoot(dir):
	var b = bullet.instance()
	get_parent().add_child(b)
	b.fire($Gun.global_position, dir)

func attack(pos):
	# shoot bullet
	if can_attack:
		print("shoot")
		shoot(pos)
		shoot_timer.start()
		can_attack = false

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

func _on_ShootTimer_timeout():
	can_attack = true

func _on_WarmUpTimer_timeout():
	pass # Replace with function body.
