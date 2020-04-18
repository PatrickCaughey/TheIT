extends RigidBody2D

onready var items = $".."

var stone_time = 30
var stone1timer = -2.0
var stone2timer = -2.0

var stone1state = true
var stone2state = true

var respawn = -2.0
var respawn_time = 120.0
var starting_position

var stonescn = preload("res://Stone.tscn")

func _ready():
	starting_position = position

func interact_item(player,item):
	if GlobalVars.holding.item_id == 14:
		var stone = null
		if stone1state:
			stone1state = false
			stone = stonescn.instance()
			items.add_child(stone)
			stone.mute_respawn = true
			stone.position = $Stone1Spawn.global_position
			stone1timer = stone_time
		elif stone2state:
			stone2state = false
			stone = stonescn.instance()
			items.add_child(stone)
			stone.mute_respawn = true
			stone.position = $Stone2Spawn.global_position
			stone2timer = stone_time
		if stone == null:
			return
		

func _process(delta):
	if respawn <= 0.0 && respawn > -1:
		visible = true
		position = starting_position
		respawn = -2.0
	else:
		respawn -= delta
	if stone1timer <= 0.0 && stone1timer > -1:
		stone1state = true
		stone1timer = -2.0
	else:
		stone1timer -= delta
	if stone2timer <= 0.0 && stone2timer > -1:
		stone2state = true
		stone2timer = -2.0
	else:
		stone2timer -= delta

func delayed_respawn():
	visible = false
	position = Vector2(-1000000,-1000000)
	respawn = respawn_time
