extends Sprite2D

@export var fall_speed: float = -7

var init_y_pos: float = 360

var has_passed: bool = false
var pass_threshold = -280

func _init():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += Vector2(0, fall_speed)
	
	if global_position.y < -280 and not $Timer.is_stopped():
		# print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()
		has_passed = true

func Setup(target_x: float, target_frame:int):
	global_position = Vector2(target_x, init_y_pos)
	frame = target_frame
	
	set_process(true)


func _on_destroy_timer_timeout() -> void:
	queue_free()
