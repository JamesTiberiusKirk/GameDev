extends Actor
class_name Actor_ranged

var bullet = preload("res://scenes/objects/Bullet/Bullet.tscn")

func shoot(dir):
	var b = bullet.instance()
	get_parent().add_child(b)
	b.fire($Gun.global_position, dir.angle())
