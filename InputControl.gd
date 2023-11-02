extends Node2D
class_name InputControl

var _event: InputEvent

func _input(event):
	_event = event
	#print(_event)

func get_input_position() -> Vector2:
	
	if (_event is InputEventScreenTouch) or (_event is InputEventScreenDrag):
		print(_event.position)
		return _event.position
	
	"""
	if Input.is_action_pressed("left_mouse_click"):
		return get_global_mouse_position()"""
	
	return Vector2.ZERO
