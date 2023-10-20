# This class extends the base animation strategy and uses an AnimationPlayer for animations.
extends animation_strategy
class_name animation_player_strategy

# A reference to the AnimationTree node.
var animation_tree: AnimationTree

# The constructor initializes the AnimationTree and updates the animation based on the direction.
func _init(_animation_tree, _direction):
	animation_tree = _animation_tree
	if animation_tree != null:
		# Active l'arbre d'animation
		animation_tree.active = true
		update_animation(_direction)

# This function executes the animation strategy if the AnimationTree is not null.
func execute(_direction):
	if animation_tree != null:
		update_animation(_direction)

# Met à jour le paramètre d'animation en fonction du vecteur de direction.
func update_animation(_direction):
	if _direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = _direction
