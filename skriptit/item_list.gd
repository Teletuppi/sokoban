extends ItemList

func levelit_listaan() -> void:
	var dir = DirAccess.open("res://levels/")
	if dir == null:
		print("ERROR: couldn't open res://levels/")
		return

	dir.list_dir_begin()
	var file_name = dir.get_next()
	var found: Array[String] = []
	while file_name != "":
		if not dir.current_is_dir() and file_name.begins_with("level_") and file_name.ends_with(".tscn"):
			var level_name = file_name.get_basename()
			var number_part = level_name.trim_prefix("level_")
			if number_part.is_valid_int():
				found.append(level_name)
		file_name = dir.get_next()
	dir.list_dir_end()

	found.sort_custom(func(a, b):
		return int(a.trim_prefix("level_")) < int(b.trim_prefix("level_"))
	)

	for level in found:
		var idx = add_item(level)
		set_item_metadata(idx, "res://levels/" + level + ".tscn")

func _ready() -> void:
	levelit_listaan()
	pass
