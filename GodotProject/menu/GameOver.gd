extends CenterContainer

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			print("key pressed")
			get_tree().change_scene("res://menu/Main_menu.tscn")
