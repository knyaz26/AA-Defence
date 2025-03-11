extends Control


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	check_for_player_input()

func check_for_player_input():
	if(Input.is_key_pressed(KEY_P)):
		get_tree().change_scene_to_file("res://game/main_map/main_map.tscn")
	if(Input.is_key_pressed(KEY_S)):
		#this line switches to options menu
		pass
	if(Input.is_key_pressed(KEY_Q)):
		get_tree().quit()

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/main_map/main_map.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://game/settings/settings.tscn")

func _on_texture_button_3_pressed() -> void:
	get_tree().quit()
