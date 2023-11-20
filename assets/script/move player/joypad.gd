extends move_strategie
class_name joypad

@export var player_joypad = [JOY_AXIS_LEFT_X, JOY_AXIS_LEFT_Y]

func _init():
	event_class_support.append("InputEventJoypadMotion")

func process_input_event(_node: Node = null, event: InputEvent = null, button = false):
	if event.axis in player_joypad:
		if event.axis_value * event.axis_value > 0.22 * 0.22:
			move_scalar[event.axis % 2] = event.axis_value
		else:
			move_scalar[event.axis % 2] = 0
		
		if move_scalar == Vector2.ZERO:
			_node.player.move = null
		else:
			_node.player.move = self
