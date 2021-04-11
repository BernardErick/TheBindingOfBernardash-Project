extends Node2D

onready var b1 = get_node("BackgroundInit")
onready var b2 = get_node("Background")
onready var b3 = get_node("Background2")
onready var b4 = get_node("Background3")
onready var b5 = get_node("Background4")
onready var b6 = get_node("Background5")
var b2Monsters = 3
var b3Monsters = 4
var b4Monsters = 4
var b5Monsters = 4
var b6Monsters = 1
func _ready():
	b1.get_node("Door").is_open = true
	b1.get_node("Door2").is_open = true
	pass 
func _process(delta):
	openRooms()
func openRooms():
	if b2Monsters == 0:
		var coin = preload("res://nodes/Coin.tscn").instance()
		coin.position = Vector2(2003.239,472.049)
		get_parent().add_child(coin)
		b2.get_node("Door").is_open = true
		b2.get_node("Door").typeDoor(2)
		b2Monsters-=1
	if b3Monsters == 0:
		b3.get_node("Door").is_open = true
		b3.get_node("Door").typeDoor(2)
		b3.get_node("Door2").is_open = true
		b3.get_node("Door2").typeDoor(2)
		b3.get_node("Door3").is_open = true
		b3.get_node("Door3").typeDoor(2)
		b3Monsters-=1
	if b4Monsters == 0:
		b4.get_node("Door").is_open = true
		b4.get_node("Door").typeDoor(2)
		b4Monsters-=1
	if b5Monsters == 0:
		var coin = preload("res://nodes/Coin.tscn").instance()
		coin.position = Vector2(713.594,2263.298)
		get_parent().add_child(coin)
		b5.get_node("Door").is_open = true
		b5.get_node("Door").typeDoor(2)
		b5.get_node("Door2").is_open = true
		b5Monsters-=1
	pass		


func _on_Background_body_entered(body): #entrando na sala 2
	if body.name == "Player":
		print("Jogador na sala 2")
		b2.get_node("Camera2").current = true
	pass 
func _on_Background_body_exited(body): #saindo da sala 2
	if body.name.substr(0,5) == "Brave":
		b2Monsters-=1
	if body.name.substr(0,4) == "ToDo":
		b2Monsters-=1
	pass # Replace with function body.

func _on_Background2_body_entered(body): #entrando na sala 3
	if body.name == "Player":
		print("Jogador na sala 3")
		b3.get_node("Camera3").current = true
	pass
func _on_Background2_body_exited(body): #saindo da sala 3
	if body.name.substr(0,5) == "Brave":
		b3Monsters-=1
	if body.name.substr(0,4) == "ToDo":
		b3Monsters-=1
	pass # Replace with function body.

func _on_Background3_body_entered(body): #etnrando na sala 4
	if body.name == "Player":
		print("Jogador na sala 4")
		b4.get_node("Camera4").current = true
	pass 
func _on_Background3_body_exited(body): #saindo da sala 4
	if body.name.substr(0,5) == "Brave":
		b4Monsters-=1
	if body.name.substr(0,4) == "ToDo":
		b4Monsters-=1
	pass # Replace with function body.

func _on_Background4_body_entered(body): #entrando na sala 5
	if body.name == "Player":
		print("Jogador na sala 5")
		b5.get_node("Camera5").current = true
	pass
func _on_Background4_body_exited(body): #saindo da sala 5
	if body.name.substr(0,5) == "Brave":
		b5Monsters-=1
	if body.name.substr(0,4) == "ToDo":
		b5Monsters-=1
	pass # Replace with function body.

func _on_Background5_body_entered(body): #entrando na sala 6/boss
	if body.name == "Player":
		print("Jogador na sala 6/ boss")
		b6.get_node("Camera6").current = true
	pass 
func _on_Background5_body_exited(body): #saindo da sala 6/boss
	#ainda nao tem nada
	pass # Replace with function body.
	
func _on_BackgroundInit_body_entered(body): #sala inicial/1
	if body.name == "Player":
		print("Jogador na sala 1")
		b1.get_node("Camera1").current = true
	pass # Replace with function body.















