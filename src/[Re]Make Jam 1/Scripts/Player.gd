extends KinematicBody2D

var speed = 200
var velocity = Vector2()

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

func _physics_process(delta):
	get_input()
	var collide = move_and_collide(velocity * delta)
