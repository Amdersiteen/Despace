extends Node

@onready var player = $Player
var pressed = false

func _input(event):
	if pressed:
		player.input_support["joystick"].process_input_event(self, event)
	else:
		# Destroy the joystick when the touch button is release
		player.input_support["joystick"].destroy(self)
		
	# Handle keyboard input
	if event is InputEventKey:
		player.input_support["keyboard"].process_input_event(self, event)

# Manage the aera where the joystick can be instantiate
func _on_touch_screen_button_pressed():
	pressed = true

func _on_touch_screen_button_released():
	pressed = false
