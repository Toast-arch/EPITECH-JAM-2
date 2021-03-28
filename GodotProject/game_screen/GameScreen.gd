extends Node2D

onready var player = $YSort/Player
onready var coinUi = $CanvasLayer/CoinUI

func _ready():
	player.connect("game_over", self, "gameOver")
	coinUi.connect("victory", self, "victory")
	
func gameOver():
	get_tree().change_scene("res://menu/GameOver.tscn")

func victory():
	get_tree().change_scene("res://menu/VictoryScreen.tscn")

func Victory():
	pass
