extends Sprite2D

@onready var falling_key = preload("res://point.tscn")
@onready var score_text = preload("res://score_press_text.tscn")
@export var key_name: String = ""

var falling_key_queue = []

var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var nice_press_threshold: float = 60
var ok_press_threshold: float = 80

var perfect_press_score: float = 250
var great_press_score: float = 100
var nice_press_score: float = 50
var ok_press_score: float = 20

func _ready():
	$GlowOverlay.frame = frame + 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if falling_key_queue.size() > 0:
		
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
			
			if not Input.is_action_pressed:
				global_position.y > -281
			else:
				var st_inst = score_text.instantiate()
				get_tree().get_root().call_deferred("add_child", st_inst)
				st_inst.SetTextInfo("MISS")
				st_inst.global_position = global_position + Vector2(0, 0)
				Signals.ResetCombo.emit()
			
	if Input.is_action_just_pressed(key_name) and falling_key_queue.size() > 0:
		var key_to_pop = falling_key_queue.pop_front()
		
		var distance_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
		
		$AnimationPlayer.stop()
		$AnimationPlayer.play("key_hit")
		
		var press_score_text: String = ""
		
		if distance_from_pass < perfect_press_threshold:
			Signals.IncrementScore.emit(perfect_press_score)
			press_score_text = "PERFECT"
			Signals.IncrementCombo.emit()
		elif distance_from_pass < great_press_threshold:
			Signals.IncrementScore.emit(great_press_score)
			press_score_text = "GREAT"
			Signals.IncrementCombo.emit()
		elif distance_from_pass < nice_press_threshold:
			Signals.IncrementScore.emit(nice_press_score)
			press_score_text = "NICE"
			Signals.IncrementCombo.emit()
		elif distance_from_pass < ok_press_threshold:
			Signals.IncrementScore.emit(ok_press_score)
			press_score_text = "OK"
			Signals.IncrementCombo.emit()
		else:
			press_score_text = "MISS"
			Signals.ResetCombo.emit()
			
			pass
		
		#key_to_pop.queue_free()
		
		var st_inst = score_text.instantiate()
		get_tree().get_root().call_deferred("add_child", st_inst)
		st_inst.SetTextInfo(press_score_text)
		st_inst.global_position = global_position + Vector2(0, 0)
		

func CreateFallingKey():
	var point = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child",point)
	point.Setup(position.x, frame + 4)
	
	falling_key_queue.push_back(point)


func _on_random_spawn_timer_timeout() -> void:
	CreateFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
