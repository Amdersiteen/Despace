extends Node

@onready var player = $Player

var dinamic_joystic = Joystick.new().get_new_joystick()

# Flag to track if a touch screen button is pressed
var pressed = false

# Handle input events
func _input(event):
	if event.get_class() in dinamic_joystic.event_class_support:
			dinamic_joystic.process_input_event(self, event)

# Manage the aera where the joystick can be instantiate
func _on_touch_screen_button_pressed():
	pressed = true

func _on_touch_screen_button_released():
	pressed = false
