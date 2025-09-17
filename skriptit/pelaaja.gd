extends RigidBody2D

@export var speed := 200.0
<<<<<<< HEAD
=======

func _ready() -> void:
	lock_rotation = true
>>>>>>> 5339a5d54e1695c782736a9b9c2531ab857caf63

func _physics_process(_delta: float) -> void:
	var input_vector := Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	input_vector = input_vector.normalized()
	
	# Directly setting linear_velocity overrides physics forces (good for player control)
	linear_velocity = input_vector * speed
