extends BaseNode

func _ready() -> void:
	var w : int = Resolution.get_width()
	var h : int = Resolution.get_height()
	var offset : int = int(h * 0.1)
	position = Vector2(10, 10)#Vector2(randf_range(offset + width, w - (offset + width)), randf_range(offset + width, h - (offset + width)))

func _process(_delta: float) -> void:
	pass


func _draw() -> void:
	super._draw()
