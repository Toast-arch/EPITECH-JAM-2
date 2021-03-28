extends Node2D

export(String) var message = ""

onready var label = $TextureRect/Label

func _ready():
	label.text = message
