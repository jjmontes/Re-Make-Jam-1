extends Node2D

var time_to_move = 0.4
var next_move_in = time_to_move

var move_to_right = true
var move_to_down = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if next_move_in <= 0:
		next_move_in = time_to_move
		var enemies = get_tree().get_nodes_in_group("enemy")
		if move_to_down:
			move_to_down = false
			move_to_right = !move_to_right
			var collide
			for enemy in enemies:
				collide = enemy.move_to_down(delta)
		else:
			for enemy in enemies:
				var collide
				if move_to_right:
					collide = enemy.move_to_right(delta)
				else:
					collide = enemy.move_to_left(delta)
				if collide != null:
					move_to_down = true
	else:
		next_move_in -= delta	
