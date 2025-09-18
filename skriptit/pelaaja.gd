extends RigidBody2D

@export var speed := 200.0

func _ready() -> void:
	lock_rotation = true
	
# Napsii pelaajan suunnan
func get_direction():
	var direction_vector := Vector2.ZERO
	direction_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return direction_vector.normalized()
	


func _physics_process(_delta: float) -> void:
	linear_velocity = get_direction() * speed
	
func _process(delta: float) -> void:
	# Sprite säätöä
	pass
