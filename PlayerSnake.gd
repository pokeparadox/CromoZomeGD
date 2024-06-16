extends Node2D

func _process(_delta):
	$Snake.stop()
	if(Input.is_action_pressed("ui_up")):
		$Snake.move_up()
	if(Input.is_action_pressed("ui_down")):
		$Snake.move_down()
	if(Input.is_action_pressed("ui_left")):
		$Snake.move_left()
	if(Input.is_action_pressed("ui_right")):
		$Snake.move_right()
