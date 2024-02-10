extends CharacterBody2D

@onready var player: Node = get_node("/root/Game/Player")

const SMOKE_EXPLOSION: Resource = preload("res://smoke_explosion/smoke_explosion.tscn")
const SPEED: float = 300.0

signal killed

var health: int = 3

func _ready() -> void:
	%Slime.play_walk_animation()

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()


func take_damage() -> void:
	health -= 1
	%Slime.play_hurt_animation()
	#print("health = {health}".format({"health": health}))
	
	if health == 0:
		var smoke: Node = SMOKE_EXPLOSION.instantiate()
		# Add smoke as a 'sibling' of the mob instead of as child
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		killed.emit()
		queue_free()
