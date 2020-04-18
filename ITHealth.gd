extends Sprite

func _process(delta):
	var health = GlobalVars.it_health / 5.0
	var width = ceil(health)*4.0
	region_rect = Rect2(0,0,width,8)
