extends Area2D

var player = null

func player_locked():
	return player != null

func _on_PlayerDetection_body_entered(body):
	player = body


func _on_PlayerDetection_body_exited(body):
	player = null
