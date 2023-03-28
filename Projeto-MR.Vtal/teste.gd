extends Node2D

const Arrow = preload("res://Arrow.tscn")
var arrow = null
var finger_down_pos = Vector2(0,0)
var finger_pos = Vector2(0,0)

func _ready():
	arrow = Arrow.instance()
	add_child(arrow)
	arrow.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		finger_down_pos = get_global_mouse_position()
	finger_pos = 
	arrow.set_rot((finger_pos - finger_down).angle())
	
