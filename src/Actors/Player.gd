extends Actor
class_name Player

func _ready():
	pass 

func _physics_process(_delta):
	# Movement
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * _delta)
	else:
		self.apply_movement(axis * ACCELERATION * _delta)
		
	self.motion = move_actor(self.motion)
	
	var look_vec = get_global_mouse_position() - global_position
	self.look_at(look_vec)
	pass

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis.normalized()



