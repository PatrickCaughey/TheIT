extends Sprite


func _process(delta):
	if GlobalVars.player_hearts >= 2:
		visible = true
	else:
		visible = false
