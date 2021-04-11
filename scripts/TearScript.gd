extends KinematicBody2D

var projectile_speed = 300
var velocity = Vector2(0,0)
var life_time = 2
var rng = RandomNumberGenerator.new()
func _ready():
	selfDestruction()
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta * projectile_speed)
	if collision:
		if collision.collider.name.substr(0,5) == "Brave":
			generate_blood(collision.collider)
			collision.collider.received_damage()
			queue_free()
		if collision.collider.name.substr(0,4) == "ToDo":
			generate_blood(collision.collider)
			collision.collider.received_damage()
			queue_free()
		self.visible = false
func selfDestruction():
	yield(get_tree().create_timer(life_time),"timeout")
	queue_free()
func generate_blood(body):
	rng.randomize()
	var type = rng.randi_range(1, 1)
	if type == 1:
		var blood = preload("res://nodes/Blood.tscn").instance()
		blood.position = body.position
		get_parent().add_child(blood)
		get_parent().move_child(blood,6)
		print(blood.get_position_in_parent())

	
