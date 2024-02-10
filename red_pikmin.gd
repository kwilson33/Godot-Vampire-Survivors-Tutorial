extends Node2D

# Testing code for animation

#func _process(_delta: float) -> void:
	#if Input.is_action_pressed("move_right"):
		#_animation_player.play("walk_right")
	#elif Input.is_action_pressed("move_left"):
		#_animation_player.play("walk_left")
	#else:
		#_animation_player.play("idle")

func play_walk_right_animation() -> void:
	%AnimationPlayer.play("walk_right")
	
func play_walk_left_animation() -> void:
	%AnimationPlayer.play("walk_left")

func play_idle_animation() -> void:
	%AnimationPlayer.play("idle")
