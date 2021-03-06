extends Area2D

export(bool) var show_hit = true

const HitEffect = preload("res://assets/Action RPG Resources/Effects/HitEffect.tscn")

onready var timer = $Timer

var invincible = false setget set_invincible

signal invincibility_started
signal invincibility_ended

func set_invincible(value):
	invincible = value
	if invincible:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	if duration != 0:
		timer.start(duration)

func hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	self.invincible = false

func _on_HurtBox_invincibility_started():
	set_deferred("monitorable", false)

func _on_HurtBox_invincibility_ended():
	set_deferred("monitorable", true)
