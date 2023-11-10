# Simple implementation of the move_strategie to demonstrate multiple input management in the main scene class
extends move_strategie
class_name move_keyboard
		
func process_input_event(_node: Node, event: InputEvent):
		_node.player.move = self
		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
		relative_strenght = 1
