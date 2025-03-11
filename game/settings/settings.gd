extends HSlider

func _ready():
	self.value_changed.connect(_on_value_changed)

func _on_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
