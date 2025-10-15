extends Node
@onready var current_level: Node = $"level 0"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(" tässä eka ")
	print_tree()
	load_level("res://levels/Level_1.tscn")
	print(" tässä toinen ")
	print_tree()
	pass
	


func load_level(path: String):
	print(current_level, "  no voi hemmeetii")
	if current_level:
		current_level.queue_free()
		await get_tree().process_frame
	var new_level = load(path).instantiate()
	add_child(new_level)
	current_level = new_level


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
