extends KinematicBody2D
class_name BaseNode

# Declare member variables here. Examples:
var target = Vector2(400,200)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTarget(t):
	target = t
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var diff = target - position
	if(diff.length() > 5):
		diff = diff * 0.001
	move_and_collide(diff)

func _draw():
	draw_circle(position, 4, Color(1,1,1))
