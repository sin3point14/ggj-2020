extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
var rot = 0
var is_rotating = false;
var init_rot
var rot_speed = rad2deg(0.1)  # 30 deg/sec
var final_rot

func _process(delta):
	if Input.is_action_just_pressed("rotate") and is_rotating == false:
		is_rotating = true 
		init_rot = rot
		final_rot = init_rot+deg2rad(90)
	if is_rotating == true:
		if rot < init_rot + deg2rad(90):
			var delta_rot = rot_speed * delta
			rot += delta_rot
			rotate(delta_rot)
		else:
			rotate(final_rot - rot)
			is_rotating = false
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
