# Simple implementation of the move_strategie to demonstrate multiple input management
extends move_strategie
class_name move_keyboard

# You need to add the input event class name to the event_class_support so the event trigger this class
func _init():
	event_class_support.append("InputEventKey")
		
func process_input_event(_node: Node = null, event: InputEvent = null, button = false):
		_node.player.move = self
		move_scalar.x = Input.get_axis("ui_left", "ui_right")
		move_scalar.y = Input.get_axis("ui_up", "ui_down")
		move_scalar = move_scalar.limit_length(1)
