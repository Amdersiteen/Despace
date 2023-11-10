# A small template to assure compatibility in the player node 
extends Node2D
class_name move_strategie

var move_scalar: Vector2 # max size is 1
var event_class_support = []

func process_input_event(_node: Node = null, event: InputEvent = null, button = false):
	pass
