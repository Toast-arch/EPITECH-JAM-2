extends Node2D

func _on_HurtBox_area_entered(area):
	PlayerStats.health += 1
	queue_free()
