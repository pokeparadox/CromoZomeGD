extends Node2D

func _ready() -> void:
	randomize()
	GameManager.connect("snake_added", _on_snake_added)

func _on_snake_added() -> void:
	pass



func _on_food_area_entered(area: Area2D) -> void:
	$Food.reset()
