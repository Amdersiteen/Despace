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

var animate_player: animate
var move: move_strategie
	
func _ready():
	# Sets top-down collision setting, collisions will be reported as on_wall.
	set_motion_mode ( MOTION_MODE_FLOATING )
	
	# Creates an instance of the behaviour class
	animate_player = animate.new(animation_tree, Vector2(0, 1))
	
func _process(delta):
	#execute the move strategie instanciate in the _init child of this class
	if move:
		# Updates the velocity based on the direction and relative strength of the move_trategie instance 
		velocity = move.direction * move.relative_strenght * SPEED / delta
		
		# Executes the animation based on the direction of the move
		animate_player.execute_animation(move.direction)
	else:
		# If no move strategy is defined, the velocity is set to zero
		velocity.x = 0#move_toward(velocity.x, 0, SPEED)
		velocity.y = 0#move_toward(velocity.y, 0, SPEED)
	
	# Applique le mouvement
	move_and_slide()
