extends Item

func _ready():
	._ready()
	item_id = 17
	red_value = 0.0
	respawn_time = 18.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Bucket.png"))
	return thing


