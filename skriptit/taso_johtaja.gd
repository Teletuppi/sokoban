extends Node
#@onready var current_level: Node = $"level 0"
@onready var current_level: Node = null
@onready var leveli: Node = $leveli
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level("res://levels/Level_0.tscn")
	
	var button = Button.new()
	button.text = "Click me"
	button.pressed.connect(load_level.bind("res://levels/Level_1.tscn"))
	add_child(button)
	

func load_level(path: String):
	print("ladattiin leveilili!")
	print_tree()
	if current_level:
		current_level.queue_free()
		await get_tree().process_frame
	var new_level = load(path).instantiate()
	leveli.add_child(new_level)
	current_level = new_level

func 
