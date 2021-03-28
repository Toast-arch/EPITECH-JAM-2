extends KinematicBody2D

var knockback = Vector2.ZERO

const EnemyDeathEffect = preload("res://assets/Action RPG Resources/Effects/BatDeathAnimation.tscn")

onready var stats = $Stats
onready var mainSprite = $Sprite
onready var shadowSprite = $ShadowSprite
onready var deathAnim = $BatDeathAnimation

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

func _on_HurtBox_area_entered(area):
	stats.health -= 1
	knockback = area.knockback_vector * 140

func _on_Stats_no_health():
	queue_free()
	var deathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(deathEffect)
	deathEffect.global_position = global_position
