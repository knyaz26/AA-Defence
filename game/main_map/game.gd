extends Sprite2D

#links
const SpriteFire = preload("res://game/aa/sprite_fire.gd")
@onready var cooldown: Timer = $cooldown

var scene_explosion = preload("res://game/explosion/explosion.tscn")
var muzzle
var instance_explosion
#vars
var fireable = true

func _ready() -> void:
	muzzle = get_node("AA/sprite_barrel/sprite_fire")  
	Engine.max_fps = 60

func _process(delta: float) -> void:
	fire()

#dictates when to fire and sends event to barrel for flames.
func fire():
	if(Input.is_action_just_pressed("fire") and fireable and get_global_mouse_position().y < 300):
		fireable = false
		cooldown.start(1.5)
		muzzle.smoke()
		instance_explosion = scene_explosion.instantiate()
		explosion()

func _on_cooldown_timeout() -> void:
	fireable = true
	
#spawns an instance of explosion scene at mouse pos.
func explosion():
	add_child(instance_explosion)
	instance_explosion.position = get_global_mouse_position()
