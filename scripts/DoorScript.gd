extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var doorBoss = preload("res://assets/canvas/door_boss.tres")
var doorClosed = preload("res://assets/canvas/door_closed.tres")
var doorOpened = preload("res://assets/canvas/door_opened.tres")
export var type = 1
export var start = false
export var is_open = false
export var pos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	typeDoor(type)
	pass # Replace with function body.
	
func typeDoor(type):
	if type == 1:
		get_node("Sprite").texture = doorClosed
	if type == 2:
		get_node("Sprite").texture = doorOpened
	if type == 3:
		get_node("Sprite").texture = doorBoss


func _on_Door_body_entered(body):
	if body.name == "Player" and is_open:
		print("na porta")
		body.position = pos
	pass # Replace with function body.
