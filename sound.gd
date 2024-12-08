extends Control

var sound_edit = AudioServer.get_bus_index("Master")



func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sound_edit, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sound_edit,true)
	else:
		AudioServer.set_bus_mute(sound_edit,false)
