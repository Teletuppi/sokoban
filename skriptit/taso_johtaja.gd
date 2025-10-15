extends Node
@onready var current_level: Node = $"level 0"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level("res://levels/Level_1.tscn")
	pass
	


func load_level(path: String):
	pass
	if current_level:
		current_level.queue_free()
	var new_level = load(path).instantiate()
	add_child(new_level)
	current_level = new_level


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
