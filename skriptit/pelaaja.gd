extends RigidBody2D
@export var speed := 200.0
# Mihin suuntaa pelaaja katselee :)
var AlaSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_05.png")
var YlaSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_02.png")
var OikSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_11.png")
var VasSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_14.png")

func _ready() -> void:
	lock_rotation = true
	
	
# Napsii pelaajan suunnan
func get_direction():
	var direction_vector := Vector2.ZERO
	direction_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return direction_vector.normalized()
	
func _physics_process(_delta: float) -> void:
	linear_velocity = get_direction() * speed
	

func _process(delta: float) -> void:
	var direction = get_direction()
	if direction.x > 0:
		$Sprite2D.texture = OikSprite
		print($Sprite2D.scale) # ??? en jaksa ny skaalata grr amimir
	pass
