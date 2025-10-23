extends Node
@onready var current_level = load("res://levels/Level_0.tscn").instantiate()
@onready var leveli: Node = $leveli

var olemassa = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level("res://levels/Level_0.tscn")

func load_signal_level(idx, _position, _mousebuttonn):
	if _mousebuttonn == MOUSE_BUTTON_LEFT:
		var path = "res://levels/Level_" + str(idx-1) + ".tscn"
		load_level(path)
		



func load_level(path: String):
	print("ladattiin leveilili! CURRENT LEVEL ON: " + str(current_level))
	current_level.queue_free()
	while is_instance_valid(current_level):
		await get_tree().process_frame
		print("GAGAGAGA")
	var new_level = load(path).instantiate()
	leveli.add_child(new_level)
	current_level = new_level
	
func _process(float) -> void:
	if Input.is_action_just_pressed("esci"):
		avaa_sulje_pause("res://scenes/pause_menu.tscn")
	

func avaa_sulje_pause(path: String):
	var UI: Resource = load(path)
	if olemassa == false:
		var siistiUI: Control = UI.instantiate()
		get_node("UI").add_child(siistiUI)
		olemassa = true
		siistiUI.get_node("ItemList").item_clicked.connect(load_signal_level.bind())
		
	else:
		get_node("UI/PauseMenu").queue_free()
		olemassa = false
