extends KinematicBody2D

enum FACING {
	UP,
	DOWN,
	RIGHT,
	LEFT
}

var speed = 40.0

var input_axis = Vector2.ZERO
var facing = FACING.DOWN
var interacter = preload("res://Interacter.tscn")

var grabber = null
var user = null
var thing = null

var frozen = false

func _process(delta):
	if !frozen:
		handle_inputs(delta)
		handle_movement(delta)
	if GlobalVars.player_hearts <= 0:
		frozen = true
		$Sprite.play("dead")

func handle_inputs(delta):
	input_axis = Vector2.ZERO
	if Input.is_action_pressed("up"):
		input_axis += Vector2.UP
		facing = FACING.UP
	if Input.is_action_pressed("down"):
		input_axis += Vector2.DOWN
		facing = FACING.DOWN
	if Input.is_action_pressed("left"):
		input_axis += Vector2.LEFT
		facing = FACING.LEFT
	if Input.is_action_pressed("right"):
		input_axis += Vector2.RIGHT
		facing = FACING.RIGHT
	if Input.is_action_just_pressed("grab"):
		if GlobalVars.holding == null:
			grab()
		else:
			drop()
	if Input.is_action_just_pressed("use"):
		$ItemSound.play()
		use()

func handle_movement(delta):
	var velocity = input_axis.normalized() * speed
	if Input.is_action_pressed("dash"):
		velocity *= 2
	move_and_slide(velocity)

func grab():
	grabber = interacter.instance()
	grabber.connect("body_entered",self,"grabber_hit")
	grabber.connect("time_out",self,"grabber_time_out")
	add_child(grabber)
	if facing == FACING.UP:
		grabber.position += Vector2(0,-8)
	if facing == FACING.DOWN:
		grabber.position += Vector2(0,8)
	if facing == FACING.RIGHT:
		grabber.position += Vector2(8,0)
	if facing == FACING.LEFT:
		grabber.position += Vector2(-8,0)
	frozen = true

func grabber_hit(body):
	if grabber == null:
		return
	if body.has_method("grab_item"):
		$GrabSound.play()
		body.grab_item(self)
		grabber.queue_free()
		grabber = null
		frozen = false

func grabber_time_out():
	grabber.queue_free()
	grabber = null
	frozen = false

func drop():
	$GrabSound.play()
	GlobalVars.holding.drop_item(self)

func use():
	if GlobalVars.holding == null:
		user = interacter.instance()
		user.connect("body_entered",self,"user_hit")
		user.connect("time_out",self,"user_time_out")
		add_child(user)
		if facing == FACING.UP:
			user.position += Vector2(0,-8)
		if facing == FACING.DOWN:
			user.position += Vector2(0,8)
		if facing == FACING.RIGHT:
			user.position += Vector2(8,0)
		if facing == FACING.LEFT:
			user.position += Vector2(-8,0)
		frozen = true
	else:
		thing = GlobalVars.holding.use_item(self)
		thing.connect("body_entered",self,"thing_hit")
		thing.connect("time_out",self,"thing_time_out")
		add_child(thing)
		if facing == FACING.UP:
			thing.position += Vector2(0,-8)
		if facing == FACING.DOWN:
			thing.position += Vector2(0,8)
		if facing == FACING.RIGHT:
			thing.position += Vector2(8,0)
		if facing == FACING.LEFT:
			thing.position += Vector2(-8,0)
		frozen = true

func user_hit(body):
	if user == null:
		return
	if body.has_method("interact"):
		body.interact(self)
		user.queue_free()
		user = null
		frozen = false

func user_time_out():
	if user == null:
		return
	user.queue_free()
	user = null
	frozen = false

func thing_hit(body):
	if thing == null:
		return
	if body.has_method("interact_item"):
		body.interact_item(self,GlobalVars.holding)
		thing.queue_free()
		thing = null
		frozen = false

func thing_time_out():
	if thing == null:
		return
	thing.queue_free()
	thing = null
	GlobalVars.holding.time_out_thing(self)
	frozen = false
