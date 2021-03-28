extends Node2D

func _process(_delta):
	$Snake.stop()
	if(Input.is_action_pressed("ui_up")):
		$Snake.moveUp()
	if(Input.is_action_pressed("ui_down")):
		$Snake.moveDown()
	if(Input.is_action_pressed("ui_left")):
		$Snake.moveLeft()
	if(Input.is_action_pressed("ui_right")):
		$Snake.moveRight()
	
	#$Snake.moveDown()
	#$Snake.moveRight()
