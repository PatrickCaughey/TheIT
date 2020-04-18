extends Item

func _ready():
	._ready()
	item_id = 02
	red_value = 15.0
	respawn_time = 40.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Pie.png"))
	return thing

func time_out_thing(player):
	GlobalVars.player_hearts += 2
	GlobalVars.holding = null
	queue_free()
