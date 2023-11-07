# Simple implementation of the move_strategie to demonstrate multiple input management in the main scene class
extends move_strategie
class_name move_keyboard
		
func set_direction_and_strenght():
		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
		relative_strenght = 1
