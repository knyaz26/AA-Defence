extends Sprite2D

#links
const SpriteFire = preload("res://game/aa/sprite_fire.gd")
@onready var cooldown: Timer = $cooldown
#vars
var fireable = true
var muzzle : Object

func _ready() -> void:
	muzzle = SpriteFire.new()

func _process(delta: float) -> void:
	fire()

#dictates when to fire and sends event to barrel for flames.
func fire():
	if(Input.is_action_just_pressed("fire") and fireable):
		fireable = false
		cooldown.start(1.5)
		explosion()
		muzzle.smoke()

func _on_cooldown_timeout() -> void:
	fireable = true
	
func explosion():
	#add where to explode and what.
	pass
