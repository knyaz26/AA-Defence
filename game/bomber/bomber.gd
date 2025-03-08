extends RigidBody2D

var mode
var dead = false
@onready var effect_damage: CPUParticles2D = $effect_damage

func _ready() -> void:
	gravity_scale = 0
	mode = "fly"

func _process(delta: float) -> void:
	check_for_arena_exited()
	match mode:
		"fly":
			fly()
		"fall":
			fall()

func fly():
	linear_velocity.x = 30 
	
func fall():
	linear_velocity.y = 20
	
func check_for_arena_exited():
	if position.x > 700:
		queue_free()

#check for collisions with explosion instance.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if !dead:
		GlobalVariables.score += 1
	mode = "fall"
	dead = true
	effect_damage.visible = true
