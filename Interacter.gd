extends Area2D

var timer = 0.0
signal time_out

func _process(delta):
	timer += delta
	if timer >= 0.25:
		emit_signal("time_out")
