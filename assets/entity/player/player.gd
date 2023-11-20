## Classe Player pour le mouvement animé et la gestion spécifique du joueur.
##
## Cette classe est responsable de la gestion des mouvements du joueur en 2D
## and updating the animation tree based on the direction of movement.

extends CharacterBody2D
class_name player

## Met en cache le nœud AnimationTree pour un accès rapide.
@onready var animation_tree: AnimationTree = $AnimationTree

## Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 200.0 / 60

var input_support = {}

var animate_player: animate
var move: move_strategie
	
func _ready():
	# Sets top-down collision setting, collisions will be reported as on_wall.
	set_motion_mode ( MOTION_MODE_FLOATING )
	
	# Instantiate supported input manager
	input_support["joystick"] = joystick.new().get_joystick()
	input_support["keyboard"] = move_keyboard.new()
	input_support["joypad"] = joypad.new()
	
	# Creates an instance of the animate class
	animate_player = animate.new(animation_tree, Vector2(0, 1))
	
func _process(delta):
	# Execute the move strategie instanciate in the _init child of this class
	if move:
		# Updates the velocity based on the move scalar of the move_trategie instance 
		velocity = move.move_scalar * SPEED / delta
		
		# Executes the animation based on the direction of the move
		animate_player.execute_animation(move.move_scalar)

	if velocity != Vector2.ZERO:
		# If no move strategy is defined, the velocity decelerate
		velocity.x = move_toward(velocity.x, 0, SPEED) / 1.1
		velocity.y = move_toward(velocity.y, 0, SPEED) / 1.1
	
	# Applique le mouvement
	move_and_slide()
	
func manage_event(_node: Node = null, event: InputEvent = null, button = false):
	# look for a manager that can prosses the event
	for supported in self.input_support.values():
		if event.get_class() in supported.event_class_support:
			supported.process_input_event(_node, event, button)
			return
"	if (!_node.player.move is joystick) and _node.player.move:
		move.move_scalar[0] = move_toward(move.move_scalar[0], 0, SPEED) / 1.1
		move.move_scalar[1] = move_toward(move.move_scalar[1], 0, SPEED) / 1.1"
