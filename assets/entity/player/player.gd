## Classe Player pour le mouvement animé et la gestion spécifique du joueur.
##
## Cette classe est responsable de la gestion des mouvements du joueur en 2D
## and updating the animation tree based on the direction of movement.  It also manages
## different input strategies for player control.


extends CharacterBody2D
class_name Player

# Met en cache le nœud AnimationTree pour un accès rapide.
@onready var animation_tree: AnimationTree = $AnimationTree

# Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 200.0 / 60

# Dictionary to store different input strategy instances.
var input_support = {}

# Instance of the Animate class for handling animations.
var animate_player: Animate

# Instance of the currently active MoveStrategy for player movement.
var move: MoveStrategy
	
func _ready():
	# Sets top-down collision setting, collisions will be reported as on_wall for the player node.
	set_motion_mode ( MOTION_MODE_FLOATING )
	
	# Instantiates supported input managers.
	input_support["keyboard"] = MoveKeyboard.new()
	input_support["joypad"] = Joypad.new()
	input_support["joystick"] = Joystick.new().get_new_joystick() # Joystick needs to be a Node2D instance to be visible on the screen
	input_support["joystick"].event_class_support.append("InputEventScreenDrag")
	# Creates an instance of the Animate class.
	animate_player = Animate.new(animation_tree, Vector2(0, 1))
	
func _process(delta):
	# Use the move strategy instantiated by the manage_event method.
	if move:
		# Updates the velocity based on the move scalar of the MoveStrategy instance.
		velocity = move.get_move_scalar() * SPEED / delta
		
		# Executes the animation based on the direction of the move
		animate_player.execute_animation(move.move_scalar)

	elif velocity != Vector2.ZERO:
		# The velocity decelerates if move is null.
		velocity.x = move_toward(velocity.x, 0, SPEED) / 1.1
		velocity.y = move_toward(velocity.y, 0, SPEED) / 1.1
	
	# Applique le mouvement
	move_and_slide()
	
func manage_event(_node: Node = null, event: InputEvent = null):
	# Looks for a manager that can process the event.
	for supported in self.input_support.values():
		if event.get_class() in supported.event_class_support:
			supported.process_input_event(_node, event)
			return
