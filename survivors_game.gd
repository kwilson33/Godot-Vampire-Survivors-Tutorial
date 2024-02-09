extends Node2D

const MOB: Resource = preload("res://mob.tscn")

func spawn_mob() -> void:
	var new_mob = MOB.instantiate()
	# Get random value along path surrounding game area
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	

func _on_timer_timeout() -> void:
	spawn_mob()

func _on_player_health_depeleted() -> void:
	%GameOverScreen.visible = true
	get_tree().paused = true
	
