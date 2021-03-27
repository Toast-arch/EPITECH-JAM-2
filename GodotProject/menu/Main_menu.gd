extends Control

var scene_path
var quit = false

onready var music = get_node("Music")
onready var button_sound = get_node("ButtonSound")

func _ready():
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	button_sound.play()
	scene_path = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	if quit:
		get_tree().quit()
	if scene_path != "NONE":
		print(get_tree().change_scene(scene_path))
	else:
		$FadeIn.hide()

func _on_QuitButton_pressed():
	button_sound.play()
	quit = true
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_AudioStreamPlayer_finished():
	music.play()
