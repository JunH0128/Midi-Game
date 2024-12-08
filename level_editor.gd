extends Node2D

const in_edit_mode: bool = false
var current_level_name = "song_name"

var level_info = {
	"song_name" = {
		"point_times": "[[9.7,9.9,10.3,10.5,12.1,12.3,12.9,13.1,13.5,13.7,14.1,14.3,14.7,14.9,15.3,15.7,15.9,17,17.2,18.3,18.6,19.4,20.2,20.9,21.2,21.6,21.8,22.6,23,23.4,23.7,24.1,24.5,24.9,25.2,25.4,25.9,26.6,27.8],[3.5,4,6.5,7,9.5,10.9,11.1,11.5,11.7,12.7,13.3,14.5,15.3,15.5,15.7,16.3,16.6,17.6,18,18.3,19,19.8,20.6,21.2,22,22.2,22.4,22.8,24.1,24.5,24.7,25.6,26.3,26.6],[3.5,4,6.5,7,9.5,10,11.3,12.7,13.9,15.1,15.5,15.9,16.1,16.6,16.8,17.2,17.4,17.8,18.1,18.4,19,19.8,20.2,21.4,21.6,23,24.5,25.6,25.9,26.1,27.4,27.8],[10,10.7,11.9,12.5,13.3,14.3,14.7,15.1,15.7,15.9,16.3,17,17.6,17.8,18.2,18.6,19.4,20.2,21.6,22.6,23,23.2,23.7,23.9,24.3,24.9,25.2,26.3,26.6,27.6]]",
		"music": load("res://Beethoven Virus.wav")
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$MusicPlayer.stream = level_info.get(current_level_name).get("music")
	$MusicPlayer.play()
	
	if in_edit_mode:
		pass
	else:
		var point_times = level_info.get(current_level_name).get("point_times")
		var point_times_arr = str_to_var(point_times)
		print(point_times[0])
		
		var counter: int = 0
		for key in point_times_arr:
			
			var button_name: String = ""
			match counter:
				0:
					button_name = "button_A"
				1:
					button_name = "button_S"
				2:
					button_name = "button_K"
				3:
					button_name = "button_L"
			
			for delay in key:
				SpawnFallingKey(button_name, delay)
				
			counter += 1
		
func SpawnFallingKey(button_name: String, delay: float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)
