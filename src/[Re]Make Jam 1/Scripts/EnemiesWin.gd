extends Area2D

func _on_EnemiesWin_body_entered(body):
	if body.is_in_group("enemy"):
		print("Game Over!!")
