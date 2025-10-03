extends RigidBody2D
@export var friction := 0.9
var lähellä = false
var lähikolot := []
var taikanumero = 0.5905303955
@onready var Area = get_node("/root/Level 0/Area2D")
@onready var collisionbox = $CollisionShape2D
@onready var areacollision = Area.get_node("CollisionShape2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Kolot"):
		print(node)
		#node.body_entered.connect(tippuuu)
	
func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	#kitkah
	linear_velocity *= friction
	angular_velocity *= friction

func tippuuu(body):
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("boksit"):
		lähellä = true
		print("JEEJEE", body) # Replace with function body.
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	lähellä = false # Replace with function body.
		
func _process(_delta):
	if(lähellä == true):
		#print((scale.x * 64 / 2 + scale.x * 64 / 2 * sqrt(2)))
		#print(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)))
		#print("x: ", abs(position.x - Area.position.x) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))))
		print("y: ", abs(position.y - Area.position.y) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))))
		print(areacollision.scale.x * 64 * taikanumero, "jeejeejeejee")
		if abs(position.x - Area.position.x) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero and abs(position.y - Area.position.y) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero:
		#if(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)) + (scale.x * 64 / 2 + scale.x * 64 / 2 * sqrt(pow(scale.x * 64 / 2, 2) + pow(scale.x * 64 / 2, 2))) * cos(rotation_degrees / 180 * PI) < areacollision.scale.x * 64 / 2 + scale.x * 64 / 2):
			print("JOUJOUUU")
			tippuuu(self)
			
