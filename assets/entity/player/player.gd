## Classe Player pour le mouvement animé et la gestion spécifique du joueur.
##
## Cette classe est responsable de la gestion des mouvements du joueur en 2D basés 
## sur la physique et de la mise à jour de l'arbre d'animation en fonction 
## de la direction du mouvement.

extends CharacterBody2D
class_name player

## Met en cache le nœud AnimationTree pour un accès rapide.
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var JoyStick = $"../JoyStik"

## Vitesse constante à laquelle le personnage se déplace.
const SPEED: float = 250.0 * 60


var animate_player: animate
var move: move_player
#var move: move_manager
	
func _ready():
	# Sets top-down collision setting, collisions will be reported as on_wall.
	set_motion_mode ( MOTION_MODE_FLOATING )
	
	#instance of the behaviour class
	move = move_player.new(JoyStick)
	animate_player = animate.new(animation_tree, move.direction)
	
func _process(delta):
	#execute the move strategie instanciate in the _init child of this class
	move.delta = delta
	velocity = move.get_velocity()
	
	#velocity = move.direction * move.relative_strength * SPEED * delta
	animate_player.execute_animation(move.direction)
	# Applique le mouvement
	move_and_slide()
	
func _input(event):
	print(event)
	#move.compute_move(event)
	move.set_velocity(velocity, event)
