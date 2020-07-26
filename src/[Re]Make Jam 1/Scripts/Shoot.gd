extends Area2D

var speed = -200

func _ready():
	pass # Replace with function body.

func _process(delta):
	var velocity = Vector2(0, 1)
	velocity = velocity.normalized() * speed
	position += velocity * delta
