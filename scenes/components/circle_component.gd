extends Node2D
class_name CircleComponent

@export var radius : float = 100.0
@export var color : Color

func _draw():
	draw_arc(Vector2.ZERO, radius, 0, 7, 100, color)
