# Simple implementation of the move_strategie to demonstrate multiple input management
extends MoveStrategy
class_name MoveKeyboard

# You need to add the input event class name to the event_class_support so the event trigger this class
func _init():
	# Initialization method to set up event class support.
	event_class_support.append("InputEventKey")
		
# Process input events and update move_scalar accordingly.
func process_input_event(_node: Node = null, event: InputEvent = null):
		# Set the move strategy for the player node
		_node.player.move = self
		
		# Retrieve keyboard input and limit the length to 1
		move_scalar.x = Input.get_axis("ui_left", "ui_right")
		move_scalar.y = Input.get_axis("ui_up", "ui_down")
		move_scalar = move_scalar.limit_length(1)
		
		if move_scalar == Vector2.ZERO:
			_node.player.move = null
