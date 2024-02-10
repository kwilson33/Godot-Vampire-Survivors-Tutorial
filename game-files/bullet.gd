extends Area2D

var travelled_distance: float = 0.0
const SPEED: float = 1000.0
const RANGE: float = 1200

func _physics_process(delta: float) -> void:
	# Get current direction in which bullet is pointing
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	# Make motion time dependent
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
