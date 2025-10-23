extends Node
#@onready var current_level: Node = $"level 0"
@onready var current_level: Node = null
@onready var buttoon: Button = $Button
@onready var leveli: Node = $leveli
var olemassa = false
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
	
func _process(float) -> void:
	if Input.is_action_just_pressed("esci"):
		avaa_sulje_ui("res://scenes/ui.tscn")

func avaa_sulje_ui(path: String):
	var UI: = load(path)
	if olemassa == false:
		add_child(UI.instantiate())
		olemassa = true
	else:
		get_node("ui").queue_free()
		olemassa = false
	print_tree()
	print("täs printataaaaaaaaaaaa")
