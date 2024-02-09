extends Node2D


func play_walk_animation() -> void:
	%AnimationPlayer.play("walk")


func play_hurt_animation() -> void:
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
