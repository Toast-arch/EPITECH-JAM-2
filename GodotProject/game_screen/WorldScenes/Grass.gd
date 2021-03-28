extends Node2D

const GrassEffect = preload("res://assets/Action RPG Resources/Effects/GrassEffect.tscn")
const newHeart = preload("res://game_screen/WorldScenes/Heart.tscn")
const newNyanCat = preload("res://game_screen/WorldScenes/NyanCat.tscn")

func grass_effect():
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position

func spawn_heart():
	var newHeartInstance = newHeart.instance()
	get_parent().add_child(newHeartInstance)
	newHeartInstance.global_position = global_position

func spawn_nyancat():
	var newNyanCatInstance = newNyanCat.instance()
	get_parent().add_child(newNyanCatInstance)
	newNyanCatInstance.global_position = global_position

func _on_HurtBox_area_entered(area):
	grass_effect()
	if rand_range(0, 100) < 5:
		spawn_heart()
	if rand_range(0, 100) > 95:
		spawn_nyancat()
	queue_free()
