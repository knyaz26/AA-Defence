extends RigidBody2D

var mode
var dead = false
@onready var effect_damage: CPUParticles2D = $effect_damage
@onready var plane: AnimatedSprite2D = $AnimatedSprite2D
@onready var plane_explosion: AnimatedSprite2D = $AnimatedSprite2D2

func _ready() -> void:
	gravity_scale = 0
	mode = "fly"

func _process(delta: float) -> void:
	check_for_arena_exited()
	check_for_crash()
	match mode:
		"fly":
			fly()
		"fall":
			fall()
		"crushed":
			crush()

func fly():
	position.x += 0.7
	
func fall():
	if rotation_degrees < 10:
		rotation += 0.005
	position += Vector2(0.7, 0.7)
	
func check_for_arena_exited():
	if position.x > 700:
		if !dead:
			GlobalVariables.game_over = true
		queue_free()

#check for collisions with explosion instance.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if !dead and !GlobalVariables.game_over:
		GlobalVariables.score += 3
	mode = "fall"
	dead = true
	effect_damage.visible = true

func check_for_crash():
	if position.y > 320:
		mode = "crushed"
	
func crush():
	plane_explosion.visible = true
	if plane.visible:
		$PlaneExplosion.play()
	plane.visible = false
	plane_explosion.play("explosion")
	
func _on_animated_sprite_2d_2_animation_finished() -> void:
	queue_free()
