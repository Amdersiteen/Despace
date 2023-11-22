# Joypad move strategy to handle InputEventJoypadMotion events.
extends MoveStrategy
class_name Joypad

# Set the left joypad as the joypad that move the player
@export var player_joypad = [JOY_AXIS_LEFT_X, JOY_AXIS_LEFT_Y]

# Add the InputEventJoypadMotion in the supported event list so the manage_event methode of plqyer can chose this class
func _init():
	event_class_support.append("InputEventJoypadMotion")

# Process input events to update move_scalar based on joypad motion
func process_input_event(_node: Node = null, event: InputEvent = null):
	# If the joypad event is the one that can move the player
	if event.axis in player_joypad:
		# Filter the axis value so small unwanted movements of the joypad don't trigger a move or a direction change in the animation
		if event.axis_value * event.axis_value > 0.22 * 0.22:
			move_scalar[event.axis % 2] = event.axis_value
		else:
			# If the value is small, set the corresponding axis to zero
			move_scalar[event.axis % 2] = 0
		
		# Set the move variable of the player to null if no move, so the player can decelerate
		if move_scalar == Vector2.ZERO:
			_node.player.move = null
		else:
			# Set the player move to this so the player movement can be updated each frame
			_node.player.move = self
