class_name joystik_fac

var joystick_scene
var joystick_node: Node2D
var position = Vector2(100, 100)

func get_joystick() -> Node2D:
	joystick_scene = load("res://assets/entity/joyStick/joystik.tscn")
	joystick_node = joystick_scene.instantiate()
	joystick_node.apply_scale(Vector2(0.2, 0.2))
	joystick_node.position = position
	return joystick_node
	
func set_position(_position: Vector2):
	joystick_node.position = _position
	
