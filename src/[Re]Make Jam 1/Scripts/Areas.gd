extends Area2D

func _on_Areas_bullet_entered(body):
	if body.is_in_group("bullet"):
		pass
	pass # Replace with function body.

func _on_Areas_enemy_entered(body):
	if body.is_in_group("enemy"):
		print("Game Over!!")
