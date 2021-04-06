extends KinematicBody2D

var velocity = Vector2(-1,0)
export var speed = 100
var can_change = true
var touchPlayer = false
var rng = RandomNumberGenerator.new()
onready var Player = get_parent().get_node("Player")
var can_hit = true
var life = 5
func _ready():
	rng.randomize()
	pass 
	
func _physics_process(delta):
	_attackThePlayer()
	_movement_worm(delta)
	pass
	
func _movement_worm(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
			var new_route = rng.randi_range(1,4)
			if new_route == 1 and can_change: #right
				velocity.x = 1
				velocity.y = 0
				can_change = false
			elif new_route == 2 and can_change: #left
				velocity.x = -1
				velocity.y = 0
				can_change = false
			elif new_route == 3 and can_change: #up
				velocity.x = 0
				velocity.y = -1
				can_change = false
			elif new_route == 4 and can_change: #down
				velocity.x = 0
				velocity.y = 1
				can_change = false
			yield(get_tree().create_timer(0.5),"timeout")
			can_change = true

func _on_Area2D_body_entered(body):
	if body == Player:
		touchPlayer = true
		can_hit = true
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if body == Player:
		touchPlayer = false
	pass # Replace with function body.
func _attackThePlayer():
	if touchPlayer and can_hit:
		can_hit = false
		Player.received_damage()
		yield(get_tree().create_timer(1.0),"timeout")
		can_hit = true
func received_damage():
	get_node("Sprite").visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = true
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = true
	life -= 1
	if life == 0:
		yield(get_tree().create_timer(0.1),"timeout")
		queue_free()
