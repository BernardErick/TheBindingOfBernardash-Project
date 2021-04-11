extends Area2D

onready var Player = get_parent().get_node("Player")

func _ready():
	pass 

func _on_Coin_body_entered(body):
	if body.name == "Player":
		Global.player_coins += 1
		queue_free()
	pass # Replace with function body.
