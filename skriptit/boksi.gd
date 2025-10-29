extends RigidBody2D
@export var friction := 0.9
var lähellä = false
var lähikolot := []
var taikanumero = 0.5905303955
var hengityshuone = 1.1
@onready var tasojohtaja = $/root/TasoJohtaja
@onready var Tilemapsi: TileMapLayer = get_node("/root/TasoJohtaja/leveli").get_child(0).get_node("TileMapLayer")
var Areat = []
@onready var collisionbox = $CollisionShape2D
signal reiässä

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("skene puu: ")
	tasojohtaja.print_tree()
	#print(Tilemapsi.reiätvalmiit)
	Tilemapsi.reiätvalmiit.connect(_reiitetään)
	#print(get_node("/root/TasoJohtaja").get_child(1), "  tää on readyssä ")


func _reiitetään() -> void:
	#print("AOOOOOOOOOOOOOOO SE")
	for node in get_tree().get_nodes_in_group("Kolot"):
		#print(node)
		#print(get_node("/root/TasoJohtaja").get_child(0))
		#print(" META DATA ", node.get_meta("väri"))
		Areat.append(node)
	
	
func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	#kitkah kitkah 
	kitkah()

func kitkah() -> void:
	linear_velocity *= friction
	angular_velocity *= friction

func tippuuu(Area: Area2D):
	print(Area)
	var atlascoords = Vector2(1, 0)
	reiässä.emit(position, atlascoords)
	queue_free()
	Area.queue_free()
	var boksinimi: String = name
	while boksinimi[boksinimi.length()-1].is_valid_int():
		boksinimi = boksinimi.replace(str(boksinimi[boksinimi.length()-1]), "")
	
	# tällä sitten scorea joku päivä ELÄ TUHOA !!!!!!
	# print(Area.get_meta("kohta"))	
	
	#hah
	if boksinimi == "boksi_ruskea":
		Tilemapsi.set_cell(Tilemapsi.local_to_map(Area.position), 0, Vector2i(6, 4))
	if boksinimi == "boksi_punainen":
		Tilemapsi.set_cell(Tilemapsi.local_to_map(Area.position), 0, Vector2i(7, 4))
	if boksinimi == "boksi_sininen":
		Tilemapsi.set_cell(Tilemapsi.local_to_map(Area.position), 0, Vector2i(8, 4))
	if boksinimi == "boksi_luiginvihreä":
		Tilemapsi.set_cell(Tilemapsi.local_to_map(Area.position), 0, Vector2i(9, 4))
	if boksinimi == "boksi_harmaa":
		Tilemapsi.set_cell(Tilemapsi.local_to_map(Area.position), 0, Vector2i(10, 4))
		
	
	pass

func _process(_delta):
	for Area in Areat:
		if Area == null:
			continue
		var areacollision = Area.get_child(0)

		#print("öh ", "positionit: ", Area.position, areacollision.position, " globaalit: ", to_global(), to_local(Area.position), to_global(areacollision), to_local(areacollision))
		if abs(position.x - Area.position.x) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero * hengityshuone and abs(position.y - Area.position.y) + abs(scale.x * 64 / 2 * cos(deg_to_rad(rotation_degrees))) + abs(scale.x * 64 / 2 * sin(deg_to_rad(rotation_degrees))) <= areacollision.scale.x * 64 * taikanumero * hengityshuone:
		#if(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)) + (scale.x * 64 / 2 + scale.x * 64 / 2 * sqrt(pow(scale.x * 64 / 2, 2) + pow(scale.x * 64 / 2, 2))) * cos(rotation_degrees / 180 * PI) < areacollision.scale.x * 64 / 2 + scale.x * 64 / 2):
		#if(sqrt(pow(Area.position.x - position.x, 2) + pow(Area.position.y - position.y, 2)) < 200):
			print("JOUJOUUU")
			Areat.erase(Area)
			tippuuu(Area)
			
