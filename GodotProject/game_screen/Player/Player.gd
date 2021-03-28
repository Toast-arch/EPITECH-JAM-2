extends KinematicBody2D

const FRICTION = 800
const ACCELERATION = 500
const MAX_SPEED = 150

enum {
	MOVE,
	ROLL,
	ATTACK
}

const dauphine = "le soleil de la vie de baptiste"

var state = MOVE

var velocity = Vector2.ZERO
var roll_vector = Vector2.LEFT

var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitBox = $HitboxPivot/AttackHitBox
onready var hurtBox = $HurtBox

signal game_over

func _ready():
	stats.connect("no_health", self, "die")
	animationTree.active = true
	swordHitBox.knockback_vector = roll_vector
	print(swordHitBox.knockback_vector)

func die():
	print("player died")
	emit_signal("game_over")
	queue_free()

func _physics_process(delta):
	match state:
		MOVE:
			move(delta)
		ROLL:
			pass
		ATTACK:
			attack(delta)

func move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swordHitBox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("ui_attack"):
		state = ATTACK

func attack(delta):
	animationState.travel("Attack")
	velocity = Vector2.ZERO

func attack_animation_finished():
	state = MOVE

func _on_HurtBox_area_entered(area):
	print("player hit")
	stats.health -= 1
	hurtBox.start_invincibility(1)
	hurtBox.hit_effect()
