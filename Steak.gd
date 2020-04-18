extends Item

func _ready():
	._ready()
	item_id = 21
	red_value = 21.0
	respawn_time = 40.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Meat.png"))
	return thing

func time_out_thing(player):
	GlobalVars.player_hearts += 2
	GlobalVars.holding = null
	queue_free()
