extends KinematicBody2D

var velocity = Vector2(0,0)
export var speed = 200
var touchPlayer = false
var slow = 80
var player_entered = false
onready var Player = get_parent().get_node("Player")
var life = 5
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	_movement_brave(delta)
	_runToPlayer()
	pass
	
func _movement_brave(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		if collision.collider == Player and !touchPlayer:
			touchPlayer = true
			Player.received_damage(self)
			yield(get_tree().create_timer(1.2),"timeout")
			touchPlayer = false
		else:
			touchPlayer = false
		#touchPlayer = false
		
func _on_AtackArea_body_entered(body):
	if body == Player:
		player_entered = true

func _on_AtackArea_body_exited(body):
	if body == Player:
		player_entered = false
	pass # Replace with function body.
	
func _runToPlayer():
	if player_entered:
		position += (Player.position - position)/slow
		
func received_damage():
	get_node("Sprite").visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = true
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = true
	life -= 1
	print("minha vida e ",life)
	if life == 0:
		yield(get_tree().create_timer(0.1),"timeout")
		queue_free()
