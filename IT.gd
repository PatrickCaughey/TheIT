extends StaticBody2D

func interact(player):
	GlobalVars.player_hearts -= 1
	GlobalVars.it_health += 5
	$GiveHeartsSound.play()
	
func interact_item(player,item):
	if item.item_id == 18:
		get_tree().change_scene("res://Victory.tscn")
		GlobalVars.done = true
	GlobalVars.holding = null
	GlobalVars.it_health += item.red_value
	item.delayed_respawn()
	$DonateSound.play()
