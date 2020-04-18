extends RigidBody2D

func interact_item(player,item):
	if GlobalVars.holding.item_id == 16:
		GlobalVars.holding = null
		item.delayed_respawn()
		queue_free()
