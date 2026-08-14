extends Node

@onready var current_level = load("res://levels/level_0.tscn")
@onready var leveli: Node = $leveli
@onready var kamera: Camera2D = $Camera2D

var olemassa = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if current_level == null:
		print("ERROR: Initial level not found")
		return
	current_level = current_level.instantiate()
	leveli.add_child(current_level)

func load_signal_level(idx, _position, _mousebuttonn):
	if _mousebuttonn == MOUSE_BUTTON_LEFT:
		var path = "res://levels/level_" + str(idx) + ".tscn"
		load_level(path)


func load_level(path: String):
	print("ladattiin leveilili! CURRENT LEVEL ON: " + str(current_level))
	current_level.queue_free()
	while is_instance_valid(current_level):
		await get_tree().process_frame
		print("GAGAGAGA")
	var new_level = load(path)
	if new_level == null:
		print("ERROR: Level resource not found at " + path)
		return
	current_level = new_level.instantiate()
	leveli.add_child(current_level)

func _process(float) -> void:
	if Input.is_action_just_pressed("esci"):
		avaa_sulje_pause("res://scenes/pause_menu.tscn")


func avaa_sulje_pause(path: String):
	var UI: Resource = load(path)
	if UI == null:
		print("ERROR: UI resource not found at " + path)
		return
	if olemassa == false:
		var siistiUI: Control = UI.instantiate()
		get_node("UI").add_child(siistiUI)
		olemassa = true
		siistiUI.get_node("ItemList").item_clicked.connect(load_signal_level.bind())
	else:
		get_node("UI/PauseMenu").queue_free()
		olemassa = false
