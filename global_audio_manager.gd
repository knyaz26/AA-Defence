extends Node2D


func _process(delta: float) -> void:
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
