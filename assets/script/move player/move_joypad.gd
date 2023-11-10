# Manage joypad motion event !!!not tested i don't have joypad now!!!
extends move_strategie
class_name move_joypad

func _init():
	event_class_support.append("InputEventJoypadMotion")
	
func process_input_event(_node: Node = null, event: InputEvent = null, button = false):
	move_scalar[event.axis] =  event.axis_value
	_node.player.move = self
