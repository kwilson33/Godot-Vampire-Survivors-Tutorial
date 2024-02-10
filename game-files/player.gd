extends CharacterBody2D

signal health_depeleted

var health: float = 100.0
const DAMAGE_RATE:float = 100.0

# TODO: Make damage higher over time and based on enemies killed

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	var overlapping_mobs: Array[Node2D] = %HurtBox.get_overlapping_bodies()
	
	# Lost health, and multiply by delta to lose health based on time
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%HealthBar.value = health
		#print("player health = {health}".format({"health": health}))
	
	if health <= 0.0:
		health_depeleted.emit()
