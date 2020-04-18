extends Item

func _ready():
	._ready()
	item_id = 12
	red_value = 0.0
	respawn_time = 4.0

func use_item(player):
	var thing = .use_item(player)
	thing.set_sprite(preload("res://Sword.png"))
	thing.set_v_frames(4)
	if player.facing == player.FACING.UP:
		thing.set_frame(3)
	if player.facing == player.FACING.DOWN:
		thing.set_frame(0)
	if player.facing == player.FACING.RIGHT:
		thing.set_frame(1)
	if player.facing == player.FACING.LEFT:
		thing.set_frame(2)
	return thing
