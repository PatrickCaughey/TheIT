extends Node2D

var letterscn = preload("res://Letter.tscn")

export var string: String = ""
var letters = []
var line_width = 112

func _ready():
	draw_letters()

func set_string(input):
	string = input
	clear_letters()
	draw_letters()

func clear_letters():
	for l in letters:
		l.queue_free()
	letters.resize(0)

func draw_letters():
	var offset_x = 0
	var offset_y = 0
	var i = 0
	letters.resize(string.length())
	for c in string:
		letters[i] = letterscn.instance()
		letters[i].frame = ord(c)
		add_child(letters[i])
		letters[i].position = Vector2(offset_x,offset_y)
		offset_x += 8
		if offset_x >= line_width:
			offset_x = 0
			offset_y += 8
		i += 1
