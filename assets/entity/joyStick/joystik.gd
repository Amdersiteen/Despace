extends Node2D
class_name joystick

@onready var knob = $knob
@onready var input = $"../InputControl"

var joystick_relative_strenght
var joystick_direction : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	knob.input = input

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	joystick_relative_strenght = knob.joystick_relative_strenght
	joystick_direction = knob.joystick_direction
