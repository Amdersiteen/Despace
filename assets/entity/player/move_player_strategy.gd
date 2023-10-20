# This class extends the base movement strategy and uses player input for movement.
extends move_strategy
class_name move_player_strategy

# This function executes the movement strategy based on player input.
func execute_movement(delta, _velocity) -> Vector2:
	# Gère l'entrée pour le mouvement directionnel
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	# Applique la vélocité en fonction de la direction ou décélérer si aucune direction n'est fournie
	if direction:
		_velocity = direction * SPEED * delta
	else:
		_velocity.x = move_toward(_velocity.x, 0, SPEED)
		_velocity.y = move_toward(_velocity.y, 0, SPEED)
	
	# Normalise la vélocité et appliquer la vitesse
	return _velocity.normalized() * SPEED * delta
