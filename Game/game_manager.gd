extends Node

signal snake_added

var snake_count : int = 0

func add_snake() -> void:
	snake_count += 1
	emit_signal("snake_added")
