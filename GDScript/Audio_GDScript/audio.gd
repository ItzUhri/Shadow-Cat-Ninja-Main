extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Sounds_Slide.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/SFX_Slide.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	
	$VBoxContainer/Sounds_Slide.value_changed.connect(_on_sounds_slide_value_changed)
	$VBoxContainer/SFX_Slide.value_changed.connect(_on_sfx_slide_value_changed)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	release_focus()


func _on_sounds_slide_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))


func _on_sfx_slide_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
