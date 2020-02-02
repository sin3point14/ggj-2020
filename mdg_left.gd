extends Sprite
var Bullet = preload("res://bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	shoot()
	pass # Replace with function body.
var time=0
func _process(delta):
	time+=delta
	if time >0.6 and get_tree().get_root().get_node("World").idx == 1:
		time=0
		shoot()
		print('pew')
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func shoot():
    # "Muzzle" is a Position2D placed at the barrel of the gun.
    var b = Bullet.instance()
    get_parent().add_child(b)