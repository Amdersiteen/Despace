## Classe Player pour le mouvement animé et la gestion spécifique du joueur.
##
## Cette classe est responsable de la gestion des mouvements du joueur en 2D
## and updating the animation tree based on the direction of movement.


extends CharacterBody2D
class_name Player

# So i don't need to know what is the up or right vector
var player_direction = {"up": Vector2(0, -1), "down": Vector2(0, 1), "right": Vector2(1, 0), "left": Vector2(-1, 0)}

# Met en cache le nœud AnimationTree pour un accès rapide.
@onready var animation_tree: AnimationTree = $AnimationTree

# Vitesse constante à laquelle le personnage se déplace.
@export var SPEED: float = 200.0 / 60

# Pourcentage de vitesse retiré au joueur à chaque frame
@export var FRICTION: float = 10
@export var MIN_PLAYER_SPEED: int = 10
@export var player_init_direction: String = "up"

# Instance of the Animate class for handling animations.
var animate_player: Animate
	
func _ready():
	# Sets top-down collision setting, collisions will be reported as on_wall for the player node.
	set_motion_mode ( MOTION_MODE_FLOATING )
	animate_player = Animate.new(animation_tree, player_direction[player_init_direction])
	
func _process(delta):
	# Update velocity and animation based on user input, or decelerate if no input is detected.
	
	var input_scalar = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	
	# Check if there is any user input
	if input_scalar != Vector2.ZERO:
		# Calculate velocity based on the input scalar of max length 1
		velocity = input_scalar.limit_length(1) * SPEED / delta
		
		# Executes the animation based on the direction of the movement
		animate_player.execute_animation(velocity.normalized())
	
	# If there is no user input and the player is still moving
	elif  velocity != Vector2.ZERO:
		# Decelerate the velocity
		
		# Check if the velocity is below a threshold
		if velocity.length() < MIN_PLAYER_SPEED:
			velocity = Vector2.ZERO
		else:
			# Decelerate the velocity based on friction
			velocity = velocity.limit_length(velocity.length() * (1 - FRICTION / (100 * 60 * delta)))
	
	# Applique le mouvement
	move_and_slide()
