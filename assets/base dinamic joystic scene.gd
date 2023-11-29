extends Node
class_name BaseDinamicJoystickScene

# Reference to the Player node
@onready var player = $Player

var dinamic_joystic = Joystick.new().get_new_joystick()
var event_manager = EventManager.new()

# Flag to track if a touch screen button is pressed
var pressed = false

# Handle input events
func _input(event):
	# Delegate the input event to the event_manager for processing
	event_manager.manage_event(self, event, [dinamic_joystic])

# Manage the aera where the joystick can be instantiate
func _on_touch_screen_button_pressed():
	pressed = true

func _on_touch_screen_button_released():
	pressed = false
