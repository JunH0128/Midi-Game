extends Sprite2D

@onready var falling_key = preload("res://point.tscn")
@export var key_name: String = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key_name):
		CreateFallingKey()

func CreateFallingKey():
	var point = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child",point)
	point.Setup(position.x, frame + 4)
