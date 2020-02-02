extends KinematicBody2D

var speed = 700
var velocity = Vector2()
var time = 0
func start():
	#position = pos
	velocity = Vector2(speed, 0)

func _physics_process(delta):
	time+=delta
	var collision = move_and_collide(-velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit()
	if time > 1:
	    queue_free()