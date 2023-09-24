extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionH = Input.get_axis("ui_left", "ui_right")
	var directionV = Input.get_axis("ui_up", "ui_down")
	if directionH:
		velocity.x = directionH * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionV:
		velocity.y = directionV * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	velocity = velocity.normalized()*SPEED
	move_and_slide()
