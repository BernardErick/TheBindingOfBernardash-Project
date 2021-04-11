extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	generateRandomBlood()
	pass

func generateRandomBlood():
	var randNumber = rng.randi_range(1,5)
	$Sprite.texture = load("res://assets/canvas/blood" + str(randNumber) + ".tres")
