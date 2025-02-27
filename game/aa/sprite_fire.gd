extends Sprite2D

@onready var timer: Timer = $Timer

func _ready() -> void:
	visible = false


func _process(delta: float) -> void:
	pass

#activated upon fire to release flames for 0.2 sec.
func smoke():
	visible = true
	timer.start(0.3)
	
func _on_timer_timeout() -> void:
	visible = false
