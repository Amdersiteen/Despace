# This class manage the player movement.
class_name move_player

## Stocke la direction par default.
var direction: Vector2 = Vector2(0, 1)
var _joystick: joystick
var strenght = 1

## Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 200.0 * 60

func _init(_joy_stick: joystick):
	if _joy_stick:
		_joystick = _joy_stick

# This function return the velocity based on the player input.
func get_velocity(delta: float, _velocity: Vector2) -> Vector2:
	# Gère l'entrée pour le mouvement directionnel

	if _joystick:
		direction = _joystick.joystick_direction
		strenght = _joystick.joystick_relative_strenght
	else:
		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
		strenght = 1
	
	# Décélérer si aucune direction n'est fournie
	if direction == Vector2.ZERO:
		_velocity.x = move_toward(_velocity.x, 0, SPEED)
		_velocity.y = move_toward(_velocity.y, 0, SPEED)
		return _velocity

	# Normalise la direction et appliquer la vitesse
	return (direction).normalized() * strenght * SPEED * delta
