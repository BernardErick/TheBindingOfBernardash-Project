extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	generateRandomBlood()
	pass

func generateRandomBlood():
	var randNumber = rng.randi_range(1,5)
	if randNumber == 1:
		$Sprite.texture = load("res://assets/canvas/blood1.tres")
	if randNumber == 2:
		$Sprite.texture = load("res://assets/canvas/blood2.tres")
	if randNumber == 3:
		$Sprite.texture = load("res://assets/canvas/blood3.tres")
	if randNumber == 4:
		$Sprite.texture = load("res://assets/canvas/blood4.tres")
	if randNumber == 5:
		$Sprite.texture = load("res://assets/canvas/blood5.tres")

