extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("snake_added", _on_snake_added)

func _on_snake_added() -> void:
	pass
