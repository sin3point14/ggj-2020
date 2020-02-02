extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
var rot = 0
var is_rotating = 0;
var init_rot
var rot_speed = rad2deg(0.1)  # 30 deg/sec
var final_rot

onready var player = get_node("test")

func _process(delta):
	if Input.is_action_just_pressed("rotate") and is_rotating == 0:
		is_rotating = 1 
		init_rot = rot
		final_rot = init_rot+deg2rad(90)
	if is_rotating == 1:
		if rot < init_rot + deg2rad(90):
			var delta_rot = rot_speed * delta
			rot += delta_rot
			rotate(delta_rot)
			player.rotate(-delta_rot)
		else:
			rotate(final_rot - rot)
			player.rotate(rot - final_rot)			
			is_rotating = 0
	if Input.is_action_just_pressed("rotate_anti") and is_rotating == 0:
		is_rotating = -1 
		init_rot = rot
		final_rot = init_rot-deg2rad(90)
	if is_rotating == -1:
		if rot > init_rot - deg2rad(90):
			var delta_rot = -rot_speed * delta
			rot += delta_rot
			rotate(delta_rot)
			player.rotate(-delta_rot)
			
		else:
			rotate(final_rot - rot)
			player.rotate(rot - final_rot)						
			is_rotating = 0
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
