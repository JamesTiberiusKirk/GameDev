extends Actor_ranged

func _physics_process(delta):
	var axis = get_input_axis()
	handle_shooting()

	self.apply_direction(axis)
	self.look_at(get_look_vect())
	pass

func handle_shooting():

	if Input.is_action_pressed("shoot"):
		var dir = get_look_vect()
		self.shoot(dir)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis.normalized()

func get_look_vect():
	return get_global_mouse_position() - global_position
