# Manage the knob position relative to the joystic position and update the move_scalar that is needed for the player movement
extends MoveStrategy
class_name Joystick

# Reference to the knob node
@onready var knob = $knob

# Reference to the joystick node
var joystick_node: Node2D

# Flag to track the existence of the joystick node
var joystick_exist: bool = false

# Size of the parent node
var parent_size: int = 512

# Add the supported event input class name to the supported class list of this class
func _init():
	event_class_support.append("InputEventScreenDrag")
	event_class_support.append("InputEventScreenTouch")
	
# Instantiate and return a new joystick node
func get_new_joystick() -> Node2D:
	# Load and instantiate the joystick node from a file.
	joystick_node = load("res://assets/entity/joystick/joystick.tscn").instantiate()
	joystick_node.apply_scale(Vector2(0.2, 0.2))
	return joystick_node

# Set the move_scalar based on the event position position
func set_move_scalar(event_position: Vector2):
		# Distance between the center of the parent node and the center of the knob
		var joystick_lenght = min(scale.x * parent_size / 2, global_position.distance_to(event_position))
		var relative_strenght = joystick_lenght / (scale.x * parent_size / 2)
		var direction = global_position.direction_to(event_position)
		move_scalar = direction * relative_strenght
	
# Process input events to update the joystick and knob positions
func process_input_event(_node: Node = null, event: InputEvent = null):
	if _node.pressed:
		if event is InputEventScreenTouch:
			if event.pressed:
				self.position = event.position

		if event is InputEventScreenDrag:
				if !joystick_exist :
					# Add the joystick as a child of the node if it doesn't exist and mark its existence.
					_node.add_child(self)
					joystick_exist = true
					
				# Update the joystick's direction and strength, and knob's position during drag.
				self.set_move_scalar(event.position)
				# Update the knob's global position based on the direction and joystick length.
				knob.global_position = move_scalar * (scale.x * parent_size / 2) + global_position
				
				var player = _node.player
				if !player.move is Joystick:
					# Set the player's move to the joystick if not already set.
					player.move = self
	else:
		# Set the player's move to null and remove the joystick if it exists.
		_node.player.move = null
		if joystick_exist:
			_node.remove_child(self)
			joystick_exist = false
