extends Sprite


func _process(delta):
	if GlobalVars.player_hearts >= 3:
		visible = true
	else:
		visible = false
