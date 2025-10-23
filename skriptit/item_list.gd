extends ItemList

func levelit_listaan() -> void:
	var laskin = 0
	#var new_level = load(path).instantiate()
	#leveli.add_child(new_level)
	var path = "res://levels/Level_+" + laskin + ".tscn"
	print("MEGA PATH YHISTYS " + path)
	pass

func _ready() -> void:
	
	pass
