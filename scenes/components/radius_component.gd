extends Node2D
class_name RadiusComponent

@export var min_radius : float = 0.0
@export var max_radius : float = 100.0
var current_radius : float = 0.0

@export var color : Color
@export var color_alpha_min : float = 0.0
@export var color_alpha_max : float = 1.0

@export var duration : float = 1.0
var time_elapsed : float = 0


func _process(delta):
	time_elapsed += delta
	if current_radius >= max_radius: time_elapsed = 0
	current_radius = lerp(min_radius, max_radius, (time_elapsed/duration))
	var new_alpha = lerp(color_alpha_min, color_alpha_max, (time_elapsed/duration))
	color = Color(color.r, color.g, color.b, new_alpha)
	queue_redraw()


func _draw():
	draw_circle(Vector2.ZERO, current_radius, color)
