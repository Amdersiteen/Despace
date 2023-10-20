#Base class for the movement strategies
class_name move_strategy

## Stocke la direction par default.
var direction: Vector2 = Vector2(0, 1)

## Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 200.0 * 60

# This function will be overridden by subclasses to execute the movement strategy.
func execute_movement(delta, _velocity) -> Vector2:
	#Please shut the parameter never use
	delta = delta
	_velocity = _velocity
	return Vector2.ZERO
