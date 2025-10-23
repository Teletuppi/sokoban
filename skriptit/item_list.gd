extends ItemList

func levelit_listaan() -> void:
	var laskin = 0
	var path = "res://levels/Level_" + str(laskin) + ".tscn"
	while ResourceLoader.exists(path):
		var level = "level_" + str(laskin)
		path = "res://levels/" + level + ".tscn"
		laskin += 1
		print("MEGA PATH YHISTYS " + path)
		if ResourceLoader.exists(path):
			add_item(level)
	#var new_level = load(path).instantiate()
	#leveli.add_child(new_level)
	
	
	pass

func _ready() -> void:
	levelit_listaan()
	pass
