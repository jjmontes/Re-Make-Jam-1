extends KinematicBody2D

var lateral_speed = 200
var down_speed = 1000
var velocity = Vector2()


func move_to_left():
	velocity.x = -lateral_speed

func move_to_right():
	velocity.x = lateral_speed

func move_to_down():
	velocity.y = down_speed
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
