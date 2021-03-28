extends KinematicBody2D
class_name BaseNode

var target
var lastCollision
var colour = Color(1,1,1)
var speed = 0.1
onready var width = (getRadius()*2) + 4

func setTarget(t):
	target = t

func getRadius():
	return $CollisionShape2D.shape.radius

func _process(_delta):
	var diff = target - position
	if(diff.length() > width):
		diff = diff.normalized() * speed
		lastCollision = move_and_collide(diff)

func _draw():
	draw_circle(position, getRadius(), colour)
