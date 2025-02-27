extends Sprite2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	aim(get_global_mouse_position())

#rotates the barrel based on mouse pos.
func aim(dir):
	if dir.y < 300:
		look_at(dir)
		rotation+=deg_to_rad(90)
