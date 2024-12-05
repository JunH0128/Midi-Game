extends Sprite2D

@export var fall_speed: float = -2.5

var init_y_pos: float = 360

func _init():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += Vector2(0, fall_speed)
	
	if global_position.y < -280 and not $Timer.is_stopped():
		print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()

func Setup(target_x: float, target_frame:int):
	global_position = Vector2(target_x, init_y_pos)
	frame = target_frame
	
	set_process(true)