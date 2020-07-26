extends Node2D

var enemy_scene = preload("res://Scenes/Enemy.tscn")

var time_to_move = 0.4
var next_move_in = time_to_move

var move_to_right = true
var move_to_down = false

func _ready():
	start_level()

func start_level():
	var enemy = enemy_scene.instance()
	enemy.position = Vector2(94, 84)
	add_child(enemy)
	enemy = enemy_scene.instance()
	enemy.position = Vector2(214, 84)
	add_child(enemy)

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
		var border = _get_enemies_border()
		if move_to_right:
			move_to_down = border.rigthes.test_move_to_right(delta)
		else:
			move_to_down = border.leftes.test_move_to_left(delta)
	else:
		next_move_in -= delta	

func _get_enemies_border():
	var enemies = get_tree().get_nodes_in_group("enemy")
	var rigthes = null
	var leftes = null
	for enemy in enemies:
		if rigthes == null || enemy.position.x > rigthes.position.x:
			rigthes = enemy
		if leftes == null || enemy.position.x < leftes.position.x:
			leftes = enemy
	return {"rigthes": rigthes, "leftes": leftes}
