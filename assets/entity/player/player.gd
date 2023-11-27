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
const GRAVITY: float = 1.1

# Instance of the Animate class for handling animations.
var animate_player: Animate
	
func _ready():
	# Sets top-down collision setting, collisions will be reported as on_wall for the player node.
	set_motion_mode ( MOTION_MODE_FLOATING )

	# Creates an instance of the Animate class.
	animate_player = Animate.new(animation_tree, Vector2(0, 1))
	
func _process(delta):
	# Updates the velocity and animation based on the user input if there is a input else decelerates if the player still move.
	if !(Input.get_axis("ui_left", "ui_right") == 0 and Input.get_axis("ui_up", "ui_down") == 0):
		velocity = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).limit_length(1) * SPEED / delta
		# Executes the animation based on the direction of the move
		animate_player.execute_animation(velocity.normalized())
	elif  velocity != Vector2.ZERO:
		# The velocity decelerates if move is null.
		velocity.x = move_toward(velocity.x, 0, SPEED) / GRAVITY
		velocity.y = move_toward(velocity.y, 0, SPEED) / GRAVITY
	
	# Applique le mouvement
	move_and_slide()
