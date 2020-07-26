extends Area2D

func _on_BulletBuster_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
