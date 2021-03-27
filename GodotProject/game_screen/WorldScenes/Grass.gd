extends Node2D

func grass_effect():
	var GrassEffect = load("res://assets/Action RPG Resources/Effects/GrassEffect.tscn")
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_HurtBox_area_entered(area):
	if Input.is_action_pressed("ui_attack"):
		grass_effect()
		queue_free()
