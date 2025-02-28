extends RigidBody2D

var mode

func _ready() -> void:
	gravity_scale = 0
	mode = "fly"

func _process(delta: float) -> void:
	match mode:
		"fly":
			fly()
		"fall":
			fall()

func fly():
	linear_velocity.x = 50
	
func fall():
	linear_velocity.y = 40

#check for collisions with explosion instance.
func _on_area_2d_body_entered(body: Node2D) -> void:
	mode = "fall"
