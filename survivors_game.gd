extends Node2D

const MOB: Resource = preload("res://mob.tscn")

var enemyDeathCount: int = 0

func _ready() -> void:
	# TODO: I don't like the way I'm updating the label text here
	%KillCount.text = "Killed: {0}".format([enemyDeathCount])

func spawn_mob() -> void:
	# Instantiate new mob & connect the killed signal
	var new_mob: Node = MOB.instantiate()
	new_mob.killed.connect(_on_enemy_killed)
	
	# Get random value along path surrounding game area
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	

func _on_timer_timeout() -> void:
	spawn_mob()

func _on_player_health_depeleted() -> void:
	# TODO: Move this code somewhere else for managing the game over stuff
	%GameOverText.text = "GAME OVER... SLIME SUPREMACY\n\n\nEnemies killed: {0}".format([enemyDeathCount])
	%GameOverScreen.visible = true
	get_tree().paused = true
	
# TODO: Not sure I'm connecting the mob 'killed' signal the best way
func _on_enemy_killed() -> void:
	enemyDeathCount += 1
	# TODO: I don't like the way I'm updating  the label text here
	%KillCount.text = "Killed: {0}".format([enemyDeathCount])
	#print("enemyDeathCount = {enemyDeathCount}".format({"enemyDeathCount": enemyDeathCount}))
	
