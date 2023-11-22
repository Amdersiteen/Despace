extends Node

# Reference to the Player node
@onready var player = $Player

# Flag to track if a touch screen button is pressed
var pressed = false

# Handle input events
func _input(event):
	# Delegate the input event to the player for processing
	player.manage_event(self, event)

# Manage the aera where the joystick can be instantiate
func _on_touch_screen_button_pressed():
	pressed = true

func _on_touch_screen_button_released():
	pressed = false
