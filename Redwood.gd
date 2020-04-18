extends Item

onready var items = $".."

func _ready():
	._ready()
	item_id = 06
	red_value = 20.0
	respawn_time = 18.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Redwood.png"))
	return thing
