# This class manage animations.
class_name Animate

# A reference to the AnimationTree node.
var animation_tree: AnimationTree

# The constructor initializes the AnimationTree and updates the animation based on the direction.
func _init(_animation_tree: AnimationTree, _direction: Vector2):
	animation_tree = _animation_tree
	if animation_tree != null:
		animation_tree.active = true
		update_animation(_direction)

# This animate the player base on the player direction.
func execute_animation(_direction: Vector2):
	if animation_tree != null:
		update_animation(_direction)

# Met à jour le paramètre d'animation en fonction du vecteur de direction.
func update_animation(_direction: Vector2):
	if _direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = _direction
