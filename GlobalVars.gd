extends Node

var player_hearts = 3
var it_health = 10.0
var total_time = 0.0
var holding = null

var done = false

func _ready():
	randomize()
	player_hearts = 3
	it_health = 10.0
	total_time = 0.0
	holding = null
	done = false
	Engine.time_scale = 1.0

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene("res://GameWorld.tscn")
		_ready()
	if done:
		return
	total_time += delta
	it_health -= delta * 0.8
	if player_hearts > 3:
		player_hearts = 3
	if it_health > 40.0:
		it_health = 40.0
	if player_hearts <= 0:
		Engine.time_scale = 5.0
	if it_health <= 0.0:
		get_tree().change_scene("res://TimeOut.tscn")
		done = true
