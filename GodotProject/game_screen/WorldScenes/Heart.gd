extends Node2D

func _on_HurtBox_area_entered(area):
	if PlayerStats.health < PlayerStats.max_health:
		PlayerStats.health += 1
		queue_free()
