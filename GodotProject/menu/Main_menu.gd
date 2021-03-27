extends Control

var scene_path
var quit = false

#onready var music = get_node("Music")
#onready var button_sound = get_node("ButtonSound")
onready var animationPlayer = $Character2D/AnimationPlayer
onready var starAnimationPlayer = $StarCharacter2D/StarAnimationPlayer
onready var starAnimationMover = $StarCharacter2D/StarAnimationMover
onready var newgamebutton = $Menu/CenterRow/Buttons/MainButtons/NewGameButton
onready var quitbutton = $Menu/CenterRow/Buttons/MainButtons/QuitButton
onready var an

func _ready():
	animationPlayer.play("MenuRun")
	starAnimationPlayer.play("MenuStarIdle")
	starAnimationMover.play("MenuStarMove")
	
	newgamebutton.connect("pressed", self, "_on_Button_pressed", [newgamebutton.scene_to_load])
	quitbutton.connect("pressed", self, "_on_Button_pressed", [quitbutton.scene_to_load])

func _on_Button_pressed(scene_to_load):
	#button_sound.play()
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
	#button_sound.play()
	quit = true
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_AudioStreamPlayer_finished():
	pass
	#music.play()

func _on_EnButton_pressed():
	TranslationServer.set_locale("en")

func _on_FrButton_pressed():
	TranslationServer.set_locale("fr")

func _on_DeButton_pressed():
	TranslationServer.set_locale("de")

func _on_EsButton_pressed():
	TranslationServer.set_locale("es")
