extends Node2D


onready var downright = $Camera2D/DownRight
onready var upleft = $Camera2D/UpLeft


func _on_Area2D_body_exited(body):
	if body.position.y > downright.global_position.y:
		position.y += 88
	if body.position.y < upleft.global_position.y:
		position.y -= 88
	if body.position.x < upleft.global_position.x:
		position.x -= 128
	if body.position.x > downright.global_position.x:
		position.x += 128
