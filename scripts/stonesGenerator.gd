extends TileMap


var rng = RandomNumberGenerator.new()

export var map = 0

func _ready():
	_generateStone()
	pass # Replace with function body.

func _generateStone():
	rng.randomize()
	var random_postion = rng.randi_range(1,5)
	map = random_postion
	print(map)
	if map == 1:
		set_cell(1,1,1)
		set_cell(1,2,1)
		set_cell(2,1,1)
		set_cell(11,1,1)
		set_cell(10,1,1)
		set_cell(11,2,1)
		set_cell(1,7,1)
		set_cell(2,7,1)
		set_cell(1,6,1)
		set_cell(11,7,1)
		set_cell(10,7,1)
		set_cell(11,6,1)
	if map == 2:
		set_cell(6,4,1)
		set_cell(5,4,1)
		set_cell(4,4,1)
		set_cell(7,4,1)
		set_cell(8,4,1)
		set_cell(6,5,1)
		set_cell(6,3,1)
		set_cell(1,1,1)
		set_cell(1,7,1)
		set_cell(11,1,1)
		set_cell(11,7,1)
	if map == 3:
		set_cell(5,4,1)
		set_cell(7,4,1)
		set_cell(6,5,1)
		set_cell(8,4,1)
		set_cell(4,4,1)
		set_cell(3,4,1)
		set_cell(9,4,1)
		set_cell(3,3,1)
		set_cell(9,3,1)
		set_cell(5,5,1)
		set_cell(7,5,1)
		set_cell(6,6,1)
	if map == 4:
		set_cell(6,3,1)
		set_cell(5,3,1)
		set_cell(7,3,1)
		set_cell(8,4,1)
		set_cell(7,5,1)
		set_cell(6,5,1)
		set_cell(5,5,1)
		set_cell(4,4,1)


