extends KinematicBody2D

var lateral_speed = 2400
var down_speed = 2000
var velocity = Vector2()


func move_to_left(delta):
	velocity = Vector2(-lateral_speed, 0)
	move_and_collide(velocity * delta)

func move_to_right(delta):
	velocity = Vector2(lateral_speed, 0)
	move_and_collide(velocity * delta)

func move_to_down(delta):
	velocity = Vector2(0, down_speed)
	return move_and_collide(velocity * delta)
	
func test_move_to_left(delta):
	velocity = Vector2(-lateral_speed, 0)
	return test_move(transform, velocity * delta)
	
func test_move_to_right(delta):
	velocity = Vector2(lateral_speed, 0)
	return test_move(transform, velocity * delta)
