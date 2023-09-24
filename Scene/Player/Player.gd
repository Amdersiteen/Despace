extends CharacterBody2D


@onready var animationTree : AnimationTree = $AnimationTree
var direction : Vector2 = Vector2.ZERO
const SPEED = 200.0

func _ready():
	direction.y = 1
	update_animation_parameter()



func _physics_process(delta):
	
	animationTree.active = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction.x  = Input.get_axis("ui_left", "ui_right")
	direction.y  = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)	
	
	velocity = velocity.normalized()*SPEED
	update_animation_parameter()
	move_and_slide()

func update_animation_parameter():
	if(direction != Vector2.ZERO):
		animationTree["parameters/Idle/blend_position"] = direction
