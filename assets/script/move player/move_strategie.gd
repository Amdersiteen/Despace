# A small template to assure compatibility in the player node 
extends Node2D
class_name MoveStrategy

# Vector representing the movement direction, limited to a maximum magnitude of 1.
var move_scalar: Vector2
# List of input event classes supported by this move strategy.
var event_class_support = []

# Method to process input events and update the move_scalar accordingly.
func process_input_event(_node: Node = null, event: InputEvent = null):
	pass
	
func get_move_scalar() -> Vector2:
	return move_scalar.limit_length(1)
