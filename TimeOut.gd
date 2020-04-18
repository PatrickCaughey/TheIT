extends Node2D


func _ready():
	var time = GlobalVars.total_time
	var minutes = floor(time / 60.0)
	var seconds = floor(fmod(time,60.0))
	$Background/Time.set_string(str(minutes) + "'" + str(seconds) + '"')
