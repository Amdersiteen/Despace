## Classe Player pour le mouvement animé et la gestion spécifique du joueur.
##
## Cette classe est responsable de la gestion des mouvements du joueur en 2D basés 
## sur la physique et de la mise à jour de l'arbre d'animation en fonction 
## de la direction du mouvement.

class_name player
extends CharacterBody2D

## Met en cache le nœud AnimationTree pour un accès rapide.
@onready var animation_tree: AnimationTree = $AnimationTree

## Stocke la direction du mouvement du joueur.
var direction: Vector2 = Vector2.ZERO

## Vitesse constante à laquelle le joueur se déplace.
const SPEED: float = 200.0

## Méthode d'initialisation, définit la direction initiale et met à jour les paramètres d'animation.
func _ready() -> void:
	direction.y = 1
	_mettre_a_jour_parametre_animation()

## Mouvement basé sur la physique et gestion de l'animation.
##
## @param delta: Le temps écoulé depuis la dernière image.
func _physics_process(delta: float) -> void:
	# Active l'arbre d'animation
	animation_tree.active = true
	
	# Gère l'entrée pour le mouvement directionnel
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	# Applique la vélocité en fonction de la direction ou décélérer si aucune direction n'est fournie
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Normalise la vélocité et appliquer la vitesse
	velocity = velocity.normalized() * SPEED
	
	# Met à jour l'arbre d'animation
	_mettre_a_jour_parametre_animation()
	
	# Applique le mouvement
	move_and_slide()

## Met à jour le paramètre d'animation en fonction du vecteur de direction.
func _mettre_a_jour_parametre_animation() -> void:
	if direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = direction
