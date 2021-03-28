extends Node

var coins = 0 setget set_coins
export(int) var max_health = 1
onready var health = max_health setget set_health

signal no_health
signal health_changed(value)
signal coins_changed(value)

func set_coins(value):
	coins = value
	emit_signal("coins_changed", coins)
	if coins > 10:
		print("GAME WON")

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
