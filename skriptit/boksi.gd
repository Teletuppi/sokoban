extends RigidBody2D
@export var friction := 0.9
var lähellä = false
var lähikolot := []
var taikanumero = 0.5905303955
<<<<<<< HEAD
var hengityshuone = 1.1
@onready var Areagaga = get_node("/root/Level 0/Area2D")
@onready var Tilemapsi = get_node("/root/Level 0/TileMapLayer")
var Areat = []
@onready var collisionbox = $CollisionShape2D
signal reiässä
=======
#@onready var Area = get_node("/root/Level 0/Area2D")
var Areat = []
#@onready var collisionbox = $CollisionShape2D
#@onready var areacollision = Area.get_node("CollisionShape2D")
>>>>>>> 5ff968c965781b33d2db7453b8b1a5cc1814ad44

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Tilemapsi.reiätvalmiit)
	Tilemapsi.reiätvalmiit.connect(_reiitetään)

func _reiitetään() -> void:
	print("AOOOOOOOOOOOOOOO SE")
	for node in get_tree().get_nodes_in_group("Kolot"):
		print(node)
		Areat.append(node)
		#node.body_entered.connect(tippuuu)
		print(node, node.position, "   ja sit kollisionshape:   ", node.get_child(0).position)
	print("AAUUAA", Areat)
	
	
func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	#kitkah
	linear_velocity *= friction
	angular_velocity *= friction

func tippuuu(body):
	var atlascoords = Vector2(1, 0)
	reiässä.emit(position, atlascoords)
	queue_free()
	pass

<<<<<<< HEAD
=======
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("boksit"):
		print("JEEJEE", body) # Replace with function body.
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
>>>>>>> 5ff968c965781b33d2db7453b8b1a5cc1814ad44
		
func _process(_delta):
	for Area in Areat:
		var areacollision = Area.get_child(0)
<<<<<<< HEAD
		#print(areacollision)
=======
>>>>>>> 5ff968c965781b33d2db7453b8b1a5cc1814ad44
		#print((scale.x * 64 / 2 + scale.x * 64 / 2 * sqrt(2)))
		#print(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)))
		#print("x: ", abs(position.x - Area.position.x) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))))
		#print("y: ", abs(position.y - Area.position.y) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))))
		#print(areacollision.scale.x * 64 * taikanumero, "jeejeejeejee")
<<<<<<< HEAD
		#print("öh ", "positionit: ", Area.position, areacollision.position, " globaalit: ", to_global(), to_local(Area.position), to_global(areacollision), to_local(areacollision))
		if abs(position.x - Area.position.x) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero * hengityshuone and abs(position.y - Area.position.y) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero * hengityshuone:
=======
		if abs(position.x - Area.position.x) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero and abs(position.y - Area.position.y) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero:
>>>>>>> 5ff968c965781b33d2db7453b8b1a5cc1814ad44
		#if(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)) + (scale.x * 64 / 2 + scale.x * 64 / 2 * sqrt(pow(scale.x * 64 / 2, 2) + pow(scale.x * 64 / 2, 2))) * cos(rotation_degrees / 180 * PI) < areacollision.scale.x * 64 / 2 + scale.x * 64 / 2):
		#if(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)) < 200):
			print("JOUJOUUU")
			tippuuu(self)
			
