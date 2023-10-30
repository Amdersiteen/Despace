# This class manage the player movement.
class_name move_player

## Stocke la direction par default.
var direction: Vector2 = Vector2(0, 1)

## Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 200.0 * 60

# This function return the velocity based on the player input.
func get_velocity(delta, _velocity) -> Vector2:
	# Gère l'entrée pour le mouvement directionnel
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	# Décélérer si aucune direction n'est fournie
	if ! direction:
		_velocity.x = move_toward(_velocity.x, 0, SPEED)
		_velocity.y = move_toward(_velocity.y, 0, SPEED)
		return _velocity

	# Normalise la direction et appliquer la vitesse
	return (direction).normalized() * SPEED * delta
