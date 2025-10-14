extends TileMapLayer
var testi = 2
@export var target_atlas_coords: Vector2i = Vector2i(11, 0)
var matching_positions: Array = []
signal reiätvalmiit

func _ready():
	for cell in get_used_cells():
		#print(cell, " -> source:", get_cell_source_id(cell), " atlas:", get_cell_atlas_coords(cell))
		var source_id = get_cell_source_id(cell)
		var atlas_coords = get_cell_atlas_coords(cell)
		
		if source_id == 0 and atlas_coords == target_atlas_coords:
			matching_positions.append(cell)
	print("TÄMÄONTÄRKEÄÄÄ!!", matching_positions)

	#print("Found ", matching_positions.size(), " matching tiles: ", matching_positions)
	#print(matching_positions)
	for cell in matching_positions:
		var area = Area2D.new()
		
		area.position = map_to_local(cell)
		area.add_to_group("Kolot")

		var collision = CollisionShape2D.new()
		collision.name = "kollision"
		var rect_shape = RectangleShape2D.new()
		rect_shape.size = Vector2(64, 64)  # <-- replace with your tile size

		collision.shape = rect_shape
		area.add_child(collision)
		print(collision.position, "TÄMÄ ON OIKEASTIKKIN TÄRKEÄ ei oikeesti mätiääss vaan sanoi")
		
		add_child(area)
		#print(area.position)
	reiätvalmiit.emit()
