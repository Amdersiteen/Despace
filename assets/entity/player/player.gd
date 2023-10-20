## Classe Player pour le mouvement animé et la gestion spécifique du joueur.
##
## Cette classe est responsable de la gestion des mouvements du joueur en 2D basés 
## sur la physique et de la mise à jour de l'arbre d'animation en fonction 
## de la direction du mouvement.

extends CharacterBody2D
class_name player

## Met en cache le nœud AnimationTree pour un accès rapide.
@onready var animation_tree: AnimationTree = $AnimationTree

# The instance of animation_strategie.
var animate: animation_strategy

# The instance of move_strategie.
var move: move_strategy

#Initialize the behaviour of the player
func _init():
	move = move_player_strategy.new()
	animate = animation_player_strategy.new(animation_tree, move.direction)
	
func _ready():
	#if i don't explicitly call init the animation_tree is NULL
	_init()
	# Sets top-down collision setting, collisions will be reported as on_wall.
	set_motion_mode ( MOTION_MODE_FLOATING )
	
func _process(delta):
	#execute the move strategie instanciate in the _init child of this class
	velocity = move.execute_movement(delta, velocity)
	animate.execute(move.direction)
	
	# Applique le mouvement
	move_and_slide()
