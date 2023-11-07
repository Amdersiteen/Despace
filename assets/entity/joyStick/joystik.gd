# Manage the knob position relative to the joystic position and update the direction and strengh that is needed for the player movement
extends move_strategie
class_name joystick

@onready var knob = $knob
var joystick_node: Node2D
var joystick_exist = false

# Distance between the center of the parent node and the center of the knob
var joystick_lenght

var parent_size = 512

# Update the knob position and compute direction and relative_strenght
func set_direction_and_strenght(event_position: Vector2):
		joystick_lenght = min(scale.x * parent_size / 2, (global_position).distance_to(event_position))
		relative_strenght = joystick_lenght / (scale.x * parent_size / 2)
		direction =(global_position).direction_to(event_position)
		#set_knob_position()
		
func set_knob_position():
	knob.global_position = direction * joystick_lenght + global_position
	
func get_joystick() -> Node2D:
	joystick_node = load("res://assets/entity/joyStick/joystik.tscn").instantiate()
	joystick_node.apply_scale(Vector2(0.2, 0.2))
	return joystick_node
	
func compute_event(_node: Node, event: InputEvent):
	if event is InputEventScreenTouch:
		if event.pressed:
			_node.input_support["joystick"].position = event.position

	if event is InputEventScreenDrag:
			if !joystick_exist :
				_node.add_child(_node.input_support["joystick"])
				joystick_exist = true
				
			_node.input_support["joystick"].set_direction_and_strenght(event.position)
			_node.input_support["joystick"].set_knob_position()
			
			if !_node.player.move is joystick:
				_node.player.move = _node.input_support["joystick"]
