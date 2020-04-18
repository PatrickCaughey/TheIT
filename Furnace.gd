extends StaticBody2D

onready var items = $".."

var inventory = []

var create_time = 3.0
var create_id = -01
var create = -2.0

var redmetalscn = preload("res://Redmetal.tscn")
var redwoodscn = preload("res://Redwood.tscn")
var keyscn = preload("res://Key.tscn")
var swordscn = preload("res://Sword.tscn")
var piescn = preload("res://Pie.tscn")
var steakscn = preload("res://Steak.tscn")
var bucketscn = preload("res://Bucket.tscn")

func _ready():
	inventory.resize(24)
	for i in range(24):
		inventory[i] = 0

func interact_item(player,item):
	GlobalVars.holding = null
	inventory[item.item_id] += 1
	item.delayed_respawn()
	check_for_recipes()

func check_for_recipes():
	if create <= 0.0 && create > -1:
		return
	if inventory[04] >= 1 && inventory[08] >= 1:
		inventory[04] -= 1
		inventory[08] -= 1
		delayed_create(10)
	if inventory[04] >= 2:
		inventory[04] -= 2
		delayed_create(06)
	if inventory[06] >= 1 && inventory[08] >= 1:
		inventory[06] -= 1
		inventory[08] -= 1
		delayed_create(16)
	if inventory[04] >= 1 && inventory[10] >= 1:
		inventory[04] -= 1
		inventory[10] -= 1
		delayed_create(12)
	if inventory[00] >= 2:
		inventory[00] -= 2
		delayed_create(02)
	if inventory[01] >= 2:
		inventory[01] -= 2
		delayed_create(02)
	if inventory[04] >= 1 && inventory[20] >= 1:
		inventory[04] -= 1
		inventory[20] -= 1
		delayed_create(21)
	if inventory[10] >= 2:
		inventory[10] -= 2
		delayed_create(13)

func _process(delta):
	if create <= 0.0 && create > -1:
		var item
		match create_id:
			06:
				item = redwoodscn.instance()
			10:
				item = redmetalscn.instance()
			16:
				item = keyscn.instance()
			12:
				item = swordscn.instance()
			02:
				item = piescn.instance()
			21:
				item = steakscn.instance()
			13:
				item = bucketscn.instance()
		items.add_child(item)
		item.mute_respawn = true
		item.position = $ItemPoint.global_position
		create = -2.0
		check_for_recipes()
	else:
		create -= delta
	
	

func delayed_create(id):
	create = create_time
	create_id = id
