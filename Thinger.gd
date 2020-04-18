extends Area2D

onready var sprite = $Sprite
var texture = null
var v_frames = 1
var frame = 0
var timer = 0.0
signal time_out

func _ready():
	if texture != null:
		sprite.texture = texture
	sprite.vframes = v_frames
	sprite.frame = frame

func _process(delta):
	timer += delta
	if timer >= 0.25:
		emit_signal("time_out")

func set_sprite(new_texture):
	texture = new_texture

func set_v_frames(new_v_frames):
	v_frames = new_v_frames

func set_frame(new_frame):
	frame = new_frame
