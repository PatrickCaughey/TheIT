extends Item

func _ready():
	._ready()
	item_id = 01
	red_value = 6.0
	respawn_time = 38.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Apple.png"))
	return thing

func time_out_thing(player):
	GlobalVars.player_hearts += 1
	GlobalVars.holding = null
	queue_free()
