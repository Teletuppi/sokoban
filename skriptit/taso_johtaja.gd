extends Node
#@onready var current_level: Node = $"level 0"
@onready var current_level: Node = null
@onready var buttoon: Button = $Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(" tässä eka ")
	print_tree()
	load_level("res://levels/Level_0.tscn")
	print(" tässä toinen ")
	print_tree()
	
	var button = Button.new()
	button.text = "Click me"
	button.pressed.connect(load_level.bind("res://levels/Level_0.tscn"))
	add_child(button)
	

func load_level(path: String):
	print_tree()
	if current_level:
		current_level.queue_free()
		await get_tree().process_frame
	var new_level = load(path).instantiate()
	add_child(new_level)
	current_level = new_level
