extends KinematicBody2D

var projectile_speed = 300
var velocity = Vector2(0,0)
var life_time = 2
func _ready():
	selfDestruction()
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta * projectile_speed)
	if collision:
		if collision.collider.name.substr(0,5) == "Brave":
			collision.collider.received_damage()
			queue_free()
		if collision.collider.name.substr(0,4) == "ToDo":
			collision.collider.received_damage()
			queue_free()
		self.visible = false
func selfDestruction():
	yield(get_tree().create_timer(life_time),"timeout")
	queue_free()
