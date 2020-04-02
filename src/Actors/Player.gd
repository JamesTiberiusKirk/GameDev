extends Actor
class_name Player

func _physics_process(delta):
	var axis = get_input_axis()
	print(axis)
	self.apply_direction(axis)
	self.look_at(get_look_vect())
	pass

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis.normalized()

func get_look_vect():
	return get_global_mouse_position() - global_position


