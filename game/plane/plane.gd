extends RigidBody2D


func _ready() -> void:
	gravity_scale = 0

func _process(delta: float) -> void:
	fly()

func fly():
	linear_velocity.x = 50
	
func fall():
	gravity_scale = 1 
