extends Node
@onready var current_level = load("res://levels/Level_0.tscn").instantiate()
@onready var leveli: Node = $leveli
@onready var kamera: Camera2D = $Camera2D

var olemassa = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level("res://levels/Level_0.tscn")

func load_signal_level(idx, _position, _mousebuttonn):
	if _mousebuttonn == MOUSE_BUTTON_LEFT:
		var path = "res://levels/Level_" + str(idx-1) + ".tscn"
		load_level(path)
		



func load_level(path: String):
	print("ladattiin leveilili! CURRENT LEVEL ON: " + str(current_level))
	current_level.queue_free()
	while is_instance_valid(current_level):
		await get_tree().process_frame
		print("GAGAGAGA")
	var new_level = load(path).instantiate()
	leveli.add_child(new_level)	
	current_level = new_level
	_kamerointi(new_level.get_child(1))
	
func _process(float) -> void:
	if Input.is_action_just_pressed("esci"):
		avaa_sulje_pause("res://scenes/pause_menu.tscn")
	
func _kamerointi(tilemap) -> void:
	print(kamera.limit_left)
	# --- 1️⃣ Get the visible rect of the TileMap in local space ---
	var used_rect = tilemap.get_used_rect()

	# --- 2️⃣ Convert that to pixel size using the tile size ---
	var cell_size = Vector2(tilemap.tile_set.tile_size)
	var map_pixel_size = Vector2(
		used_rect.size.x * cell_size.x,
		used_rect.size.y * cell_size.y
	)

	# --- 3️⃣ Get the viewport size (the window, in pixels) ---
	var viewport_size = kamera.get_viewport_rect().size

	# --- 4️⃣ Compute how much we need to zoom to fit everything ---
	var zoom_x = map_pixel_size.x / viewport_size.x
	var zoom_y = map_pixel_size.y / viewport_size.y

	# --- 5️⃣ Use the larger zoom to make sure everything fits ---
	var zoom_factor = max(zoom_x, zoom_y)

	# --- 6️⃣ Apply zoom (Camera2D zooms in with smaller numbers) ---
	kamera.zoom = Vector2(zoom_factor, zoom_factor)

	# --- 7️⃣ Center the camera on the TileMap ---
	var used_rect_pos = Vector2(used_rect.position)
	var used_rect_size = Vector2(used_rect.size)

	var map_center = (used_rect_pos + used_rect_size / 2.0) * cell_size
	#kamera.global_position = map_center
	

func avaa_sulje_pause(path: String):
	var UI: Resource = load(path)
	if olemassa == false:
		var siistiUI: Control = UI.instantiate()
		get_node("UI").add_child(siistiUI)
		olemassa = true
		siistiUI.get_node("ItemList").item_clicked.connect(load_signal_level.bind())
		
	else:
		get_node("UI/PauseMenu").queue_free()
		olemassa = false
