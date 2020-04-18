extends RigidBody2D

onready var items = $".."

var respawn = -2.0
var respawn_time = 40.0
var starting_position

var woodscn = preload("res://Log.tscn")

func _ready():
	starting_position = position

func interact_item(player,item):
	if GlobalVars.holding.item_id == 13:
		$TreeSound.play()
		var wood = null
		wood = woodscn.instance()
		items.add_child(wood)
		wood.position = position
		wood.mute_respawn = true
		delayed_respawn()

func _process(delta):
	if respawn <= 0.0 && respawn > -1:
		visible = true
		position = starting_position
		respawn = -2.0
	else:
		respawn -= delta

func delayed_respawn():
	visible = false
	position = Vector2(-1000000,-1000000)
	respawn = respawn_time
