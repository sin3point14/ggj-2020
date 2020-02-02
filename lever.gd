extends Sprite
var right = load("res://assets/lever_right.png") 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered", self, "hi")

func hi(object):
	if get_tree().get_root().get_node("World").get_node("player").right_solved == false:
		texture = right
		get_tree().get_root().get_node("World").get_node("player").right_solved = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
