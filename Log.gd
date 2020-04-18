extends Item

onready var items = $".."

var woodscn = preload("res://Redwood.tscn")

func _ready():
	._ready()
	item_id = 04
	red_value = 0.0
	respawn_time = 18.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Log.png"))
	return thing

func interact_item(player,item):
	if GlobalVars.holding.item_id == 13:
		if randi() % 3 != 1:
			delayed_respawn()
			return
		var wood = null
		wood = woodscn.instance()
		items.add_child(wood)
		wood.position = position
		wood.mute_respawn = true
		delayed_respawn()
