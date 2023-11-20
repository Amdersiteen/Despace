# Manage joypad motion event !!!not tested i don't have joypad now!!!
extends move_strategie
class_name move_joypad

@export var player_joypad_motion_active = false
@export var player_joypad_motion_id = str(JOY_AXIS_LEFT_X)

var i = 0


class joypad_motion:
	var id
	var scalar: Vector2
	
	func _init(event: InputEventJoypadMotion, _id):
		id = _id
			
		scalar[event.axis % 2] =  event.axis_value
		
	func set_scalar_from_event(event: InputEventJoypadMotion):
		if event.axis_value * event.axis_value > 0.22 * 0.22:
			scalar[event.axis % 2] =  event.axis_value
			
	func get_scalar():
		var _scalar = scalar
		if scalar[0]*scalar[0] < 0.5 * 0.5:
			_scalar[0] = 0
		
		if scalar[1]*scalar[1] < 0.5 * 0.5:
			_scalar[1] = 0
			
		return _scalar
	

			
var joypads_motion = {}
		

func _init():
	event_class_support.append("InputEventJoypadMotion")
	
func process_input_event(_node: Node = null, event: InputEvent = null, button = false):
	var _id = get_joypad_id_from_event(event)
	if !joypads_motion :
		var temp_joypad_motion = joypad_motion.new(event, _id)
		joypads_motion[temp_joypad_motion.id] = temp_joypad_motion
	else:
		if !joypads_motion.get(_id):
			var temp_joypad_motion = joypad_motion.new(event, _id)
			joypads_motion[temp_joypad_motion.id] = temp_joypad_motion
		else:
			joypads_motion[_id].set_scalar_from_event(event)
			
		if joypads_motion.get(player_joypad_motion_id):
			i = i + 1
			move_scalar = joypads_motion[player_joypad_motion_id].get_scalar()
			print(i, "   ", event)
			print(joypads_motion[player_joypad_motion_id].get_scalar())
			"if ! _node.player.move is move_joypad:"
			_node.player.move = self

func get_joypad_id_from_event(event: InputEventJoypadMotion) -> String:
	if event.axis % 2:
		return str((event.axis - 1) / 2)
	else:
		return str(event.axis / 2)
	"""
	if event.axis <= 1:
		if event.axis_value * event.axis_value > 0.2 * 0.2:
			move_scalar[event.axis % 2] =  event.axis_value
		elif event.axis_value * event.axis_value > 0.19 * 0.19:
			move_scalar[event.axis % 2] =  0
		
		move_scalar = move_scalar.limit_length(1.0)
	_node.player.move = self"""
	
