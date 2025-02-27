extends Sprite2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if get_global_mouse_position().y < 300:
		look_at(get_global_mouse_position())
		rotation+=deg_to_rad(90)
