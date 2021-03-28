extends KinematicBody2D

var knockback = Vector2.ZERO
var velocity = Vector2.ZERO

const EnemyDeathEffect = preload("res://assets/Action RPG Resources/Effects/BatDeathAnimation.tscn")

const ACC = 300
const MAX_SPEED = 80
const FRICTION = 200

onready var stats = $Stats
onready var playerDetection = $PlayerDetection
onready var sprite = $Sprite
onready var hurtBox = $HurtBox
onready var sheild = $Sheild

enum {
	IDLE,
	WANDER,
	CHASE
}

var state = CHASE
var sheilded = true

func _ready():
	sheild.connect("sheild_destroyed", self, "sheild_destroyed")

func sheild_destroyed():
	sheilded = false
	print("sheild go boom")

func look_for_player():
	if playerDetection.player_locked():
		state = CHASE

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			look_for_player()
		WANDER:
			pass
		CHASE:
			var player = playerDetection.player
			if player != null:
				var dir = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(dir * MAX_SPEED, ACC * delta)
			else:
				state = IDLE
	
	sprite.flip_h = velocity.x < 0
	velocity = move_and_slide(velocity)

func _on_HurtBox_area_entered(area):
	print("bat hit")
	if !sheilded:
		stats.health -= 1
	knockback = area.knockback_vector * 140
	hurtBox.hit_effect()

func _on_Stats_no_health():
	queue_free()
	var deathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(deathEffect)
	deathEffect.global_position = global_position
