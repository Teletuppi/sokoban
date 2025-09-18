extends TileMapLayer
var testi = 2
@export var target_atlas_coords: Vector2i = Vector2i(11, 0)
var matching_positions: Array = []

func _ready():
	for cell in get_used_cells():
		print(cell, " -> source:", get_cell_source_id(cell), " atlas:", get_cell_atlas_coords(cell))
		var source_id = get_cell_source_id(cell)
		var atlas_coords = get_cell_atlas_coords(cell)
		
		if source_id == 0 and atlas_coords == target_atlas_coords:
			matching_positions.append(cell)

	print("Found ", matching_positions.size(), " matching tiles: ", matching_positions)
	print(matching_positions)
	for cell in matching_positions:
		var area = Area2D.new()
		add_child(area)
		area.position = to_global(map_to_local(cell))
		print(area.position)
