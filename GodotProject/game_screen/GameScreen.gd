extends Node2D

onready var player = $YSort/Player
onready var coinUi = $CanvasLayer/CoinUI

var nextScene = "res://menu/GameOver.tscn"
onready var fadeIn = $CanvasLayer/FadeIn

func _ready():
	player.connect("game_over", self, "gameOver")
	coinUi.connect("victory", self, "victory")

func gameOver():
	fadeIn.show()
	fadeIn.fade_in()

func victory():
	fadeIn.show()
	fadeIn.fade_in()
	nextScene = "res://menu/VictoryScreen.tscn"

func _on_FadeIn_fade_finished():
	get_tree().change_scene(nextScene)
