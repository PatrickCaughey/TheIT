extends RigidBody2D

onready var fruit1sprite = $Sprite/Fruit1
onready var fruit2sprite = $Sprite/Fruit2
onready var items = $".."

var fruit_time = 18
var fruit1timer = -2.0
var fruit2timer = -2.0


var respawn = -2.0
var respawn_time = 60.0
var starting_position

var fruitscn = preload("res://Apple.tscn")
var woodscn = preload("res://Log.tscn")

func _ready():
	starting_position = position

func interact(player):
	var fruit = null
	if fruit1sprite.visible:
		fruit1sprite.visible = false
		fruit = fruitscn.instance()
		items.add_child(fruit)
		fruit.mute_respawn = true
		fruit.position = $Fruit1Spawn.global_position
		fruit1timer = fruit_time
	elif fruit2sprite.visible:
		fruit2sprite.visible = false
		fruit = fruitscn.instance()
		items.add_child(fruit)
		fruit.mute_respawn = true
		fruit.position = $Fruit2Spawn.global_position
		fruit2timer = fruit_time
	if fruit == null:
		return

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
	if fruit1timer <= 0.0 && fruit1timer > -1:
		fruit1sprite.visible = true
		fruit1timer = -2.0
	else:
		fruit1timer -= delta
	if fruit2timer <= 0.0 && fruit2timer > -1:
		fruit2sprite.visible = true
		fruit2timer = -2.0
	else:
		fruit2timer -= delta

func delayed_respawn():
	visible = false
	position = Vector2(-1000000,-1000000)
	respawn = respawn_time
