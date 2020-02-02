extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var has_left_key = false

var top_solved = false
var left_solved = false
var bottom_solved = false
var right_solved = false


const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 200
export var g = 10
export var jump_force = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		motion.x = speed
	elif Input.is_action_pressed('ui_left'):
		motion.x = -speed
	else:
		motion.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = -jump_force
	else:
		motion.y += g
		
	move_and_slide(motion, UP)