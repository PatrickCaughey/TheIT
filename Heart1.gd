extends Sprite


func _process(delta):
	if GlobalVars.player_hearts >= 1:
		visible = true
	else:
		visible = false
