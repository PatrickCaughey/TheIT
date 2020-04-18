extends Control


func _process(delta):
	if GlobalVars.total_time > 0.5 && GlobalVars.total_time < 2.0:
		$BG/Text.set_string("I HUNGER")
	if GlobalVars.total_time > 2.0:
		$BG/Text.set_string("")
