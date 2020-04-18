extends RigidBody2D

class_name Item

var item_id = -01
var red_value = 0.0
var thinger = preload("res://Thinger.tscn")

var mute_respawn = false
var respawn = -2.0
var respawn_time = 10.0
var starting_position

func _ready():
	starting_position = position

func grab_item(player):
	if GlobalVars.holding != null:
		return
	GlobalVars.holding = self
	visible = false
	position = Vector2(-1000000,-1000000)

func drop_item(player):
	position = player.position
	visible = true
	GlobalVars.holding = null
	if player.facing == player.FACING.UP:
		position += Vector2(0,-8)
	if player.facing == player.FACING.DOWN:
		position += Vector2(0,8)
	if player.facing == player.FACING.RIGHT:
		position += Vector2(8,0)
	if player.facing == player.FACING.LEFT:
		position += Vector2(-8,0)

func use_item(player):
	var thing = thinger.instance()
	return thing

func time_out_thing(player):
	pass

func _process(delta):
	if respawn <= 0.0 && respawn > -1:
		visible = true
		position = starting_position
		respawn = -2.0
	else:
		respawn -= delta

func delayed_respawn():
	if mute_respawn:
		queue_free()
	visible = false
	position = Vector2(-1000000,-1000000)
	respawn = respawn_time
