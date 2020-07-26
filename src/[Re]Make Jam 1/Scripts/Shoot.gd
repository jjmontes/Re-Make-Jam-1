extends Area2D

var speed = -200

func _ready():
	connect("body_entered", self, "_on_Shoot_body_entered")

func _process(delta):
	var velocity = Vector2(0, 1)
	velocity = velocity.normalized() * speed
	position += velocity * delta

func _on_Shoot_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()
