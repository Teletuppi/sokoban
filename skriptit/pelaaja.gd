extends RigidBody2D
@export var speed := 40.0
# Mihin suuntaa pelaaja katselee :)
var AlaSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_23.png")
var YlaSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_02.png")
var OikSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_11.png")
var VasSprite = preload("res://kenney_sokoban-pack/PNG/Retina/Player/player_14.png")

var skaala = 0.5

func sprite_tiskiin(sprite: Sprite2D) -> void:
	sprite.scale.x = skaala
	sprite.scale.y = skaala

func _ready() -> void:
	lock_rotation = true
	sprite_tiskiin($Sprite2D)
	
# Napsii pelaajan suunnan #moi nääsilä
func get_direction():
	var direction_vector := Vector2.ZERO
	direction_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return direction_vector.normalized()
	
func _physics_process(_delta: float) -> void:
	linear_velocity = get_direction() * speed
	
func _process(_delta: float) -> void:
	var direction = get_direction()
	# Miks niin jäätävä
	if direction.x > 0:
		$Sprite2D.texture = OikSprite
	elif direction.x < 0:
		$Sprite2D.texture = VasSprite
	if direction.y > 0:
		$Sprite2D.texture = AlaSprite
	elif direction.y < 0:
		$Sprite2D.texture = YlaSprite	
