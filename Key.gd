extends Item

onready var items = $".."

func _ready():
	._ready()
	item_id = 16
	red_value = 0.0
	respawn_time = 18.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Key.png"))
	return thing
