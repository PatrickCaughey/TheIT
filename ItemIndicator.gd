extends Sprite

func _process(delta):
	if GlobalVars.holding == null:
		visible = false
	else:
		visible = true
		frame = GlobalVars.holding.item_id
