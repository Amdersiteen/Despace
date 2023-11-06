class_name move_manager

var event: InputEvent
var move: move_strategie
var direction: Vector2 = Vector2(0, 1)
var relative_strenght: float = 0

func compute_move(_event: InputEvent):
	if  (event is InputEventScreenDrag) or (event is InputEventScreenTouch):
		if event is InputEventScreenTouch:
			var touch_event: InputEventScreenTouch = event
			if touch_event.pressed == true:
				move = joystick.new()
				move.compute_move(_event)
				direction = move.direction
				relative_strenght = move.relative_strenght
			else :
				#destroy joystic
				pass
		else:
				move.compute_move(_event)
				direction = move.direction
				relative_strenght = move.relative_strenght
				
		if event is InputEventMouse:
			pass
			
		if event is InputEventJoypadMotion:
			pass
