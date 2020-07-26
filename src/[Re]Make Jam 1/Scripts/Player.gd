extends KinematicBody2D

var speed = 200
var velocity = Vector2()
var time_to_shoot = 1
var next_shoot_in = 0

var shoot_scene = preload("res://Scenes/Shoot.tscn")

func _ready():
	pass # Replace with function body.

func move_to_left():
	velocity.x = -speed

func move_to_right():
	velocity.x = speed

func get_input():
	velocity = Vector2()
	var is_left = Input.is_action_pressed("ui_left")
	var is_right = Input.is_action_pressed("ui_right")
	
	if is_left:
		move_to_left()
	if is_right:
		move_to_right()

func get_shoot(delta):
	if (next_shoot_in <= 0):
		var is_shoot = Input.is_action_just_pressed("ui_select") || Input.is_mouse_button_pressed(BUTTON_LEFT)
		if is_shoot:
			next_shoot_in = time_to_shoot
			var shoot = shoot_scene.instance()
			shoot.position = $Canon.get_global_position()
			get_parent().add_child(shoot)
	else:
		next_shoot_in -= delta

func _physics_process(delta):
	get_input()
	get_shoot(delta)
	var collide = move_and_collide(velocity * delta)
