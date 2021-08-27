extends KinematicBody2D
class_name Player

onready var interact = $InteractionComponent

const ACCELERATION = 800
const MAX_SPEED = 250
const FRICTION = 1000
const INTERACT_POSITION_X = [35, 0, -35, 0]
const INTERACT_POSITION_Y = [0, -35, 0, 35]
var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)

		var direction = 0
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				direction = 0
			else:
				direction = 2
		else:
			if input_vector.y > 0:
				direction = 3
			else:
				direction = 1
				
		interact.position = Vector2(INTERACT_POSITION_X[direction], INTERACT_POSITION_Y[direction])

	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
