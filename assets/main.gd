extends Node

@onready var player = $Player
var input_support = {}
var pressed = false

# Initialize supported input methods
func _ready():
	input_support["joystick"] = joystick.new().get_joystick()
	input_support["keyboard"] = move_keyboard.new()
	
func _input(event):
	if pressed:
		input_support["joystick"].process_input_event(self, event)
	else:
		# Destroy the joystick when the touch button is release
		input_support["joystick"].destroy(self)
			
	# Handle keyboard input
	if event is InputEventKey:
		input_support["keyboard"].set_direction_and_strenght()
		player.move = input_support["keyboard"]


func _on_touch_screen_button_pressed():
	pressed = true


func _on_touch_screen_button_released():
	pressed = false
