extends RigidBody2D

onready var items = $".."

var puddle_time = 15
var puddle1timer = -2.0
var puddle2timer = -2.0

var puddle1state = true
var puddle2state = true

var respawn = -2.0
var respawn_time = 500.0
var starting_position

var puddlescn = preload("res://Puddle.tscn")

func _ready():
	starting_position = position

func interact_item(player,item):
	if GlobalVars.holding.item_id == 12:
		var puddle = null
		if puddle1state:
			puddle1state = false
			puddle = puddlescn.instance()
			items.add_child(puddle)
			puddle.position = $Puddle1Spawn.global_position
			puddle1timer = puddle_time
		elif puddle2state:
			puddle2state = false
			puddle = puddlescn.instance()
			items.add_child(puddle)
			puddle.position = $Puddle2Spawn.global_position
			puddle2timer = puddle_time
		if puddle == null:
			return
		

func _process(delta):
	if respawn <= 0.0 && respawn > -1:
		visible = true
		position = starting_position
		respawn = -2.0
	else:
		respawn -= delta
	if puddle1timer <= 0.0 && puddle1timer > -1:
		puddle1state = true
		puddle1timer = -2.0
	else:
		puddle1timer -= delta
	if puddle2timer <= 0.0 && puddle2timer > -1:
		puddle2state = true
		puddle2timer = -2.0
	else:
		puddle2timer -= delta

func delayed_respawn():
	visible = false
	position = Vector2(-1000000,-1000000)
	respawn = respawn_time
