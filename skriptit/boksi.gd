extends RigidBody2D
@export var friction := 0.9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Kolot"):
		print(node)
		node.body_entered.connect(tippuuu)

func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	linear_velocity *= friction
	angular_velocity *= friction
	
func tippuuu(body):
	print("GUUGUU", body)
