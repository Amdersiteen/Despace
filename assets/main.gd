extends Node

@onready var player = $Player

# dict of the support input
var input_support = {}

var pressed = false

var joystick_exist = false

# Init the supported input media
func _ready():
	input_support["joystick"] = joystick.new().get_joystick()
	input_support["keyboard"] = move_keyboard.new()
	
func _input(event):
	"""
	manage the tactil
	"""
	if pressed:
		input_support["joystick"].compute_event(self, event)
					
	else:
		player.move = null
		if joystick_exist:
			remove_child(input_support["joystick"])
			joystick_exist = false
			
	"""
	manage le clavier
	"""
	if event is InputEventKey:
		input_support["keyboard"].set_direction_and_strenght()
		player.move = input_support["keyboard"]


func _on_touch_screen_button_pressed():
	pressed = true


func _on_touch_screen_button_released():
	pressed = false
