extends Node2D

onready var direction = Vector2(0.0,0.0)
onready var speed = 0.05
var nodeGroup = "NodeGroup"
	
func _ready():
	$Head.target = Vector2(0,0)
	for x in 20:
		var node = $Head.duplicate()
		node.position = $Head.position
		node.add_to_group(nodeGroup)
		add_child(node)
		
	$Head.colour = Color(1,0,0)
		
func setPosition(pos):
	$Head.position = pos
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Head.setTarget($Head.target + (direction*speed))
	var nodes = get_tree().get_nodes_in_group("NodeGroup")
	for n in nodes:
		var index  = nodes.find(n)
		if(index == 0):
			n.setTarget($Head.position)
		else:
			n.setTarget(nodes[index-1].position)
		n.speed = speed * 2
		
	if($Head.lastCollision):
		remove_child($Head.lastCollision.collider)

func moveUp():
	direction.y = -1
	
func moveDown():
	direction.y = 1
	
func moveLeft():
	direction.x = -1
	
func moveRight():
	direction.x = 1
	
func moveUpLeft():
	moveUp()
	moveLeft()
	
func moveUpRight():
	moveUp()
	moveRight()
	
func moveDownLeft():
	moveDown()
	moveLeft()
	
func moveDownRight():
	moveDown()
	moveRight()
	
func move(dir):
	direction = dir
	
	
	
func stop():
	direction = Vector2(0.0,0.0)
