extends Node

var joystick: Node2D
var joyfac: joystik_fac
var _event
var touch
	

func _ready():
	joystick = joystik_fac.new().get_joystick()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
	
	#remove_child(joystick)
	#print(_event)
	
func _input(event):
	if event is InputEventScreenTouch:
		print("ok")
		var touch_event: InputEventScreenTouch
		touch_event = event
		print(touch_event.pressed)
		if touch_event.pressed:
			joystick.position = touch_event.position
			add_child(joystick)
		else:
			remove_child(joystick)
	#move.compute_move(event)
	#move.set_velocity(velocity, event)
