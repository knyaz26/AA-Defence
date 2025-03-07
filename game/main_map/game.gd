extends Sprite2D

#links
const SpriteFire = preload("res://game/aa/sprite_fire.gd")
@onready var cooldown: Timer = $cooldown
@onready var scoreboard: Label = $scoreboard
@onready var attack_cooldown: Label = $attack_cooldown

var plane = preload("res://game/plane/plane.tscn")
var bomber = preload("res://game/bomber/bomber.tscn")
var scene_explosion = preload("res://game/explosion/explosion.tscn")
var muzzle
var instance_explosion
#vars
var fireable = true
@export_group('spawn chances')
@export var plane_spawn_chance = 120

func _ready() -> void:
	muzzle = get_node("AA/sprite_barrel/sprite_fire")  
	Engine.max_fps = 60

func _process(delta: float) -> void:
	fire()
	spawn_planes()
	update_score()
	update_attack_cooldown()
	print(plane_spawn_chance)

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
	
func spawn_planes():
	if (!randi_range(0, plane_spawn_chance)):
		if(!randi_range(0, 5)):
			var bomber_instance = bomber.instantiate()
			add_child(bomber_instance)
			bomber_instance.position = Vector2(randi_range(-50, 0), randi_range(10, 250))
		else:
			var plane_instance = plane.instantiate()
			add_child(plane_instance)
			plane_instance.position = Vector2(randi_range(-50, 0), randi_range(10, 250))
	else:
		if(!randi_range(0, 50)):
			plane_spawn_chance += 1
			
func update_score():
	scoreboard.text = "Score:" + str(GlobalVariables.score)
	
func update_attack_cooldown():
	attack_cooldown.position = get_global_mouse_position() - Vector2(0, 20)
	attack_cooldown.text = str(cooldown.time_left).substr(0, 4) + "s"
