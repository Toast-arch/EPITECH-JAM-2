extends ColorRect

signal fade_finished

onready var streamPlayer = $AudioStreamPlayer

func fade_in():
	$AnimationPlayer.play("fade_in")
	streamPlayer.playing = true


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished")
