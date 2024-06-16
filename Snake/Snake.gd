extends Node2D
@onready var direction = Vector2.ZERO
@onready var speed : float = 100
var node_group : String

func _ready():
	node_group = Constants.snake_group + "_" + str(GameManager.snake_count)
	$Head.target = Vector2.ZERO
	$Head.is_root = true
	for x in Constants.starting_node_count:
		var node = $Head.duplicate()
		node.add_to_group(node_group)
		node.position = $Head.position
		add_child(node)
		
	$Head.colour = Color(1,0,0)
		
func set_snake_position(pos):
	$Head.position = pos
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Head.set_target($Head.target + (direction*speed * _delta))
	var nodes = get_tree().get_nodes_in_group(node_group)
	for n in nodes:
		var index  = nodes.find(n)
		if(index == 0):
			n.set_target($Head.position)
		else:
			n.set_target(nodes[index-1].position)
		n.speed = speed * _delta
		
	#if($Head.lastCollision):
	#	remove_child($Head.lastCollision.collider)

func move_up():
	direction.y = -1
	
func move_down():
	direction.y = 1
	
func move_left():
	direction.x = -1
	
func move_right():
	direction.x = 1
	
func move_up_left():
	move_up()
	move_left()
	
func move_up_right():
	move_up()
	move_right()
	
func move_down_left():
	move_down()
	move_left()
	
func move_down_right():
	move_down()
	move_right()
	
func move(dir):
	direction = dir
	
func stop():
	direction = Vector2(0.0,0.0)
