extends RigidBody2D
@export var friction := 0.9
var lähellä = false
var lähikolot := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Kolot"):
		print(node)
		#node.body_entered.connect(tippuuu)
	
func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	linear_velocity *= friction
	angular_velocity *= friction

func tippuuu(body):
	print("GUUGUUJEEJEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE", body)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Kolot"):
		print("JEEJEE", body) # Replace with function body.
		lähellä = true
		lähikolot.append(body)
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body in lähikolot):
		lähellä = false
		print("JIPPIIJIPPII", body) # Replace with function body.
		
func _process(_delta):
	print("ööh", lähikolot)
	for body in lähikolot:
		print(sqrt(pow(body.x - position.x, 2) + pow(body.y - position.y, 2)) + sin(rotation_degrees / 180 * PI) < 100)
		if(sqrt(pow(body.x - position.x, 2) + pow(body.y - position.y, 2)) + sin(rotation_degrees / 180 * PI) < 100):
			tippuuu(body)
			
