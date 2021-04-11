extends KinematicBody2D

var velocity = Vector2(0,0)
export var speed = 100
var touchPlayer = false
var slow = 120
var player_entered = false
onready var Player = get_parent().get_node("Player")
var life = 15
var texture_normal = preload("res://assets/monsters-assets/CorruptedEsp.png")
var texture_invincible = preload("res://assets/monsters-assets/CorrupetedEspArmored.png")
var is_invincible = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Serial.connect("setInvincibility",self,"_setInvincibility")
	_setInvincibility(true)
	pass # Replace with function body.
func _physics_process(delta):
	_movement_corrupted_esp(delta)
	_runToPlayer()
	pass
	
func _movement_corrupted_esp(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		if collision.collider == Player and !touchPlayer:
			touchPlayer = true
			Player.received_damage(self)
			yield(get_tree().create_timer(1.2),"timeout")
			touchPlayer = false
	else:
		touchPlayer = false


func _on_Area2D_body_entered(body):
	if body == Player:
		player_entered = true
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if body == Player:
		player_entered = false
	pass # Replace with function body.
	
func _runToPlayer():
	if player_entered:
		position += (Player.position - position)/slow

func received_damage():
	if !is_invincible:
		get_node("Sprite").visible = false
		yield(get_tree().create_timer(0.1),"timeout")
		get_node("Sprite").visible = true
		yield(get_tree().create_timer(0.1),"timeout")
		get_node("Sprite").visible = false
		yield(get_tree().create_timer(0.1),"timeout")
		get_node("Sprite").visible = true
		life -= 0.5
		if life == 0:
			yield(get_tree().create_timer(0.1),"timeout")
			queue_free()
func _setInvincibility(status):
	if status:
		get_node("Sprite").texture = texture_invincible
		is_invincible = true
	else:
		get_node("Sprite").texture = texture_normal
		is_invincible = false
		yield(get_tree().create_timer(2.0),"timeout")
		get_node("Sprite").texture = texture_invincible
		is_invincible = true	
