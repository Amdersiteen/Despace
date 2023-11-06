# This class manage the player movement.
class_name move_player

## Stocke la direction par default.
var direction: Vector2 = Vector2(0, 1)
var _joystick: joystick
var strenght = 0
var delta: float = 1/60
var velocity: Vector2 = Vector2.ZERO
var return_velocity = false
var JJ: joystick = joystick.new()

## Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 250.0 * 60

func _init(_joy_stick: joystick):
	if _joy_stick:
		_joystick = _joy_stick
		
func get_velocity() -> Vector2:
	if return_velocity == false:
		return_velocity = true
		return velocity
	elif _joystick.relative_strenght == 0:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		return velocity
	else:
		return velocity


# This function return the velocity based on the player input.
func set_velocity(_velocity: Vector2, event: InputEvent):
			
	# Gère l'entrée pour le mouvement directionnel
	"""if event is InputEventKey:
		print("Key")
		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
		strenght = 1
		return_velocity = false
		velocity = (direction).normalized() * strenght * (SPEED * delta)"""
		
		
	if  (event is InputEventScreenDrag) or (event is InputEventScreenTouch):
		
		_joystick.set_event_position(event.position)
		direction = _joystick.direction
		strenght = _joystick.relative_strenght
		return_velocity = false
		velocity = direction * strenght * (SPEED * delta)
		return"""
	elif event is InputEventMouse:
		_joystick.set_event_position(event.position)
		direction = _joystick.joystick_direction
		strenght = _joystick.joystick_relative_strenght
		return_velocity = false
		velocity = direction * strenght * (SPEED * delta)
	elif event is InputEventJoypadMotion:
		pass"""

	
	
