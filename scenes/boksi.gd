extends RigidBody2D
@export var friction := 0.9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	linear_velocity *= friction
	angular_velocity *= friction
	pass
	
