extends Node

func get_width():
	return get_resolution().x


func get_height():
	return get_resolution().y


func get_resolution():
	return DisplayServer.window_get_size()

