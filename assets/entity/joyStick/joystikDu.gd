extends move_strategie
class_name joystickDu

@onready var knob = $knob

var pressing = false

var joystick_lenght

var event_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if pressing:
		joystick_lenght = min(scale.x * 512 / 2, (global_position).distance_to(event_position))
		relative_strenght = joystick_lenght / (scale.x * 512 / 2)
		direction =(global_position).direction_to(event_position)
		knob.global_position = direction * joystick_lenght + global_position
	else:
		knob.global_position = global_position
		relative_strenght = 0
		direction = Vector2.ZERO


func _on_touch_screen_button_pressed():
	pressing = true


func _on_touch_screen_button_released():
	pressing = false

func set_event_position(_position):
	event_position = _position
