extends Sprite2D
class_name knob

@onready var parent = $".."

var pressing = false

var joystick_lenght
var joystick_relative_strenght
var joystick_direction : Vector2
var input : InputControl

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if 1:
		joystick_lenght = min(parent.scale.x * 512 / 2, (parent.global_position).distance_to(get_global_mouse_position()))
		joystick_relative_strenght = joystick_lenght / (parent.scale.x * 512 / 2)
		joystick_direction =(parent.global_position).direction_to(get_global_mouse_position())
		global_position = joystick_direction * joystick_lenght + parent.global_position
	else:
		global_position = parent.global_position
		joystick_relative_strenght = 0
		joystick_direction =Vector2.ZERO
		
func is_in_external_cercle():
	pass
