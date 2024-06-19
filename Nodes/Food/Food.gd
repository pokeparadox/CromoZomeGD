extends Area2D
class_name Food

func reset() -> void:
	var w : int = Resolution.get_width()
	var h : int = Resolution.get_height()
	var offset : int = int(h * 0.1)
	var node_width : int = $CollisionShape2D.shape.radius
	position = Vector2(randf_range(offset + node_width, w - (offset + node_width)), randf_range(offset + node_width, h - (offset + node_width)))

func _ready() -> void:
	reset()
