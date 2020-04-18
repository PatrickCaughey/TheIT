extends RigidBody2D

onready var items = $".."

var fullscn = preload("res://FullBucket.tscn")

func interact_item(player,item):
	if item.item_id == 17:
		item.delayed_respawn()
		var full = fullscn.instance()
		GlobalVars.holding = full
		items.add_child(full)
		queue_free()
