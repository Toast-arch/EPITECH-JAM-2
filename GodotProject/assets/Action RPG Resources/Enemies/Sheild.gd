extends Node2D

onready var sprite = $Sprite
var active = true setget set_active
onready var hurtBox = $HurtBox

signal sheild_destroyed

func _on_HurtBox_area_entered(area):
	sprite.hide()
	active = false
	emit_signal("sheild_destroyed")

func set_active(value):
	active = value
	hurtBox.set_deferred("monitorable", active)
