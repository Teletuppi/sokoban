extends Node

@onready var current_level = load("res://levels/level_0.tscn")
@onready var leveli: Node = $leveli
@onready var kamera: Camera2D = $Camera2D

var olemassa = false
var current_item_list: ItemList

func _ready() -> void:
	if current_level == null:
		print("ERROR: Initial level not found")
		return
	current_level = current_level.instantiate()
	leveli.add_child(current_level)

func load_signal_level(idx, _position, _mousebuttonn):
	if _mousebuttonn == MOUSE_BUTTON_LEFT:
		var path = current_item_list.get_item_metadata(idx)
		if path == null:
			print("ERROR: no metadata for item ", idx)
			return
		load_level(path)
		avaa_sulje_pause("res://scenes/pause_menu.tscn")

func load_level(path: String):
	current_level.queue_free()
	while is_instance_valid(current_level):
		await get_tree().process_frame
	var new_level = load(path)
	if new_level == null:
		print("ERROR: Level resource not found at " + path)
		return
	current_level = new_level.instantiate()
	leveli.add_child(current_level)

func _process(_delta: float) -> void:
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
		current_item_list = siistiUI.get_node("ItemList")
		current_item_list.item_clicked.connect(load_signal_level)
	else:
		get_node("UI/PauseMenu").queue_free()
		current_item_list = null
		olemassa = false
