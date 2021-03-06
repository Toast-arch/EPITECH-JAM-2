extends KinematicBody2D

const FRICTION = 800
const ACCELERATION = 500
const MAX_SPEED = 150

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("StarIdle")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right_2") - Input.get_action_strength("ui_left_2")
	input_vector.y = Input.get_action_strength("ui_down_2") - Input.get_action_strength("ui_up_2")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
