extends Area2D
class_name BaseNode

signal grow_snake

var is_root : bool = false
var target := Vector2(0.0,0.0)
var colour = Color(1,1,1):
	set(c):
		$Ellipse.fill_color = c
var speed : int = 100
@onready var width = (get_radius()*2) + 4
@onready var width_sq = width * width

func set_target(t):
	target = t

func get_diameter() -> float:
	return get_radius() * 2

func get_radius():
	return $CollisionShape2D.shape.radius

func _process(_delta):
	var diff = target - position
	if is_root:
		position += diff
	elif diff.length_squared() > width_sq:
		diff = diff.normalized() * speed * 2.6
		position += diff

func _on_area_entered(area: Area2D) -> void:
	var groups = get_groups()
	if not groups.is_empty():
		var group = get_groups().front()
		var has_group : bool = area.get_groups().size() > 0
		if group != null and has_group and not area.is_in_group(group):
			queue_free()
	elif is_root and area is Food:
		emit_signal("grow_snake")
