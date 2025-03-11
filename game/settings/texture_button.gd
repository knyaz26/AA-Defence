extends TextureButton

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_M):
		get_tree().change_scene_to_file("res://game/main_menu/main_menu.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://game/main_menu/main_menu.tscn")
