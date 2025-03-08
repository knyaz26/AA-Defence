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
	linear_velocity.x = 50
	
func fall():
	linear_velocity.y = 40

func check_for_arena_exited():
	if position.x > 700:
		GlobalVariables.game_over = true
		queue_free()
	
#check for collisions with explosion instance.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if !dead and !GlobalVariables.game_over:
		GlobalVariables.score += 1
	mode = "fall"
	dead = true
	effect_damage.visible = true
