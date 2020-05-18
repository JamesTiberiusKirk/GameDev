extends Actor

onready var ShootTimer = $ShootTimer
onready var health_bar = $HealthBar
onready var shooting_sound = $ShootingSound
onready var muzzle = $Gun
onready var bullet = preload("res://scenes/objects/Bullet/Bullet.tscn")
var can_shoot = true

export (float) var fire_rate

func _ready():
	ShootTimer.wait_time = fire_rate

func _physics_process(delta):
	var axis = get_input_axis()
	handle_shooting()
	self.apply_direction(axis)
	self.look_at(get_look_vect())
	health_bar.value = health
	HudController.health = health

func shoot(dir):
	shooting_sound.play()
	var b = bullet.instance()
	get_parent().add_child(b)
	b.fire(muzzle.global_position, dir.angle())

func handle_shooting():
	if Input.is_action_pressed("shoot"):
		if can_shoot:
			var dir = get_look_vect()
			shoot(dir)
			can_shoot = false
			ShootTimer.start()

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) 
	axis.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return axis.normalized()

func get_look_vect():
	return get_global_mouse_position() - global_position

func _on_ShootTimer_timeout():
	can_shoot = true

 
