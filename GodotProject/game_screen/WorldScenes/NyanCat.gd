extends KinematicBody2D

onready var timer = $Timer
var velocity = Vector2.ZERO

func _ready():
	timer.start(10)

func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.RIGHT * 250, 100 * delta)
	velocity = move_and_slide(velocity)

func _on_Timer_timeout():
	queue_free()
