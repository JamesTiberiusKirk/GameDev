extends Actor

export (int) var detect_radius  # size of the visibility circle
export (float) var fire_rate  # delay time (s) between bullets

var vis_color = Color(.867, .91, .247, 0.1)

var target  # who are we shooting at?

func _ready():
	# dim the sprite when not active
	$Sprite.self_modulate = Color(0.2, 0, 0)
	# set the collision area's radius
	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	$Visibility/CollisionShape2D.shape = shape
	max_speed = 100
	

func _physics_process(delta):
	update()
	# if there's a target, rotate towards it and fire
	if target:
		rotation = (target.position - position).angle()
		attack(target.position)

func attack(pos):
	#run for the player 
	print("attack")
	
	apply_direction(target.get_global_position() - position)
	pass

func _draw():
	# display the visibility area
	draw_circle(Vector2(), detect_radius, vis_color)

func _on_Visibility_body_entered(body):
	print("entered")
	# connect this to the "body_entered" signal
	if target:
		return
	target = body
	$Sprite.self_modulate.r = 1.0

func _on_Visibility_body_exited(body):
	# connect this to the "body_exited" signal
	if body == target:
		target = null
		$Sprite.self_modulate.r = 0.2


