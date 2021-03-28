extends Node2D

const GrassEffect = preload("res://assets/Action RPG Resources/Effects/GrassEffect.tscn")

func grass_effect():
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_HurtBox_area_entered(area):
	grass_effect()
	queue_free()
