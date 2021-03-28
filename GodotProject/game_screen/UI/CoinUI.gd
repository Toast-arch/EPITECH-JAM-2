extends Control

var coins = 0 setget set_coins

onready var label = $HBoxContainer/Label

func set_coins(value):
	coins = value
	if label != null:
		label.text = str(coins)

func _ready():
	self.coins = PlayerStats.coins
	PlayerStats.connect("coins_changed", self, "set_coins")
