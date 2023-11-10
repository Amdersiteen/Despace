# A small template to assure compatibility in the player node 
extends Node2D
class_name move_strategie

var direction: Vector2 = Vector2(0, 1)
var relative_strenght: float = 0

func process_input_event(_node: Node, event: InputEvent):
	pass
