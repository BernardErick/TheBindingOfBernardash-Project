extends Node2D

onready var b1 = get_node("BackgroundInit")
onready var b2 = get_node("Background")
onready var b3 = get_node("Background2")
onready var b4 = get_node("Background3")
onready var b5 = get_node("Background4")
onready var b6 = get_node("Background5")
func _ready():
	pass 



func _on_Background_body_entered(body):
	if body.name == "Player":
		print("Jogador na sala 2")
		b2.get_node("Camera2").current = true
	pass 


func _on_Background2_body_entered(body):
	if body.name == "Player":
		print("Jogador na sala 3")
		b3.get_node("Camera3").current = true
	pass

func _on_Background3_body_entered(body):
	if body.name == "Player":
		print("Jogador na sala 4")
		b4.get_node("Camera4").current = true
	pass 


func _on_Background4_body_entered(body):
	if body.name == "Player":
		print("Jogador na sala 5")
		b5.get_node("Camera5").current = true
	pass


func _on_Background5_body_entered(body):
	if body.name == "Player":
		print("Jogador na sala 6/ boss")
		b6.get_node("Camera6").current = true
	pass 

func _on_BackgroundInit_body_entered(body):
	if body.name == "Player":
		print("Jogador na sala 1")
		b1.get_node("Camera1").current = true
	pass # Replace with function body.
