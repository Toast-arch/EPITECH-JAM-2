extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var heartTexture = $HeartUIFull

func set_hearts(value):
	hearts = clamp(value, 0 , max_hearts)
	if heartTexture != null:
		heartTexture.rect_size = Vector2(15 * hearts, 11)

func set_max_hearts(value):
	max_hearts = max(value, 1)

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
