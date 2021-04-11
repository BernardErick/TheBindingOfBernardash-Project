extends KinematicBody2D

var movement = Vector2(0,0)
export var speed = 200
export var life = 3.0
var bullet = preload("res://nodes/Tear.tscn")
var can_fire = true
var rate_of_fire = 0.5
func _ready():
	pass
	
func _physics_process(delta):
	_shooting()
	_movement_player(delta)

func _movement_player(delta):
	if Input.is_action_pressed("player_up"):
		move_and_collide(Vector2(0,-speed) * delta)
	if Input.is_action_pressed("player_down"):
		move_and_collide(Vector2(0, speed)* delta)
	if Input.is_action_pressed("player_left"):
		move_and_collide(Vector2(-speed,0) * delta)
	if Input.is_action_pressed("player_right"):
		move_and_collide(Vector2(speed,0)* delta)	
		
func _shooting():
	var up = Input.is_action_pressed("shot_up_tear")
	var down = Input.is_action_pressed("shot_down_tear")
	var left = Input.is_action_pressed("shot_left_tear")
	var right = Input.is_action_pressed("shot_right_tear")
	var bullet_instance = bullet.instance()
	if can_fire and up:
		can_fire = false
		bullet_instance.position = self.position
		bullet_instance.velocity.y = -1
		get_parent().add_child(bullet_instance)
		yield(get_tree().create_timer(rate_of_fire),"timeout")
		can_fire = true
	elif can_fire and down:
		can_fire = false
		bullet_instance.position = self.position
		bullet_instance.velocity.y = 1
		get_parent().add_child(bullet_instance)
		yield(get_tree().create_timer(rate_of_fire),"timeout")
		can_fire = true
	elif can_fire and left:
		can_fire = false
		bullet_instance.position = self.position
		bullet_instance.velocity.x = -1
		get_parent().add_child(bullet_instance)
		yield(get_tree().create_timer(rate_of_fire),"timeout")
		can_fire = true
	elif can_fire and right:
		can_fire = false
		bullet_instance.position = self.position
		bullet_instance.velocity.x = 1	
		get_parent().add_child(bullet_instance)
		yield(get_tree().create_timer(rate_of_fire),"timeout")
		can_fire = true	
	pass
		
func received_damage(body):
	get_node("Sprite").visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = true
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = false
	yield(get_tree().create_timer(0.1),"timeout")
	get_node("Sprite").visible = true
	life -= 0.5
	Global.player_life -= 0.5
	if life == 0.0:
		yield(get_tree().create_timer(0.1),"timeout")
		queue_free()

