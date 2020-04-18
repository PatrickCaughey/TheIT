extends KinematicBody2D

onready var items = $".."

var respawn = -2.0
var respawn_time = 30.0
var starting_position

var facing = 1
var timer = 0.0

var meatscn = preload("res://Meat.tscn")

func _ready():
	if randi() % 2 == 0:
		facing = -1
	
	starting_position = position

func interact_item(player,item):
	if GlobalVars.holding.item_id == 12:
		var meat = null
		meat = meatscn.instance()
		items.add_child(meat)
		meat.position = position
		meat.mute_respawn = true
		delayed_respawn()

func _process(delta):
	timer += delta
	if timer > 0.5:
		if randi() % 5 == 0:
			facing *= -1
		timer = 0
	if move_and_collide(facing * Vector2(10,0) * delta):
		facing *= -1
		timer = 0
	$Sprite.flip_h = facing > 0
	
	if respawn <= 0.0 && respawn > -1:
		visible = true
		position = starting_position
		respawn = -2.0
	else:
		respawn -= delta

func delayed_respawn():
	visible = false
	position = Vector2(-100000,-100000)
	respawn = respawn_time

