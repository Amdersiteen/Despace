extends Node

@onready var player = $Player
var pressed = false

var i = 0

func _input(event):
	player.manage_event(self, event, pressed)
	#player.manage_event(self, _event, pressed)

# Manage the aera where the joystick can be instantiate
func _on_touch_screen_button_pressed():
	pressed = true

func _on_touch_screen_button_released():
	pressed = false
