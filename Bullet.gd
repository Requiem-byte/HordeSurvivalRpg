class_name Bullet
extends Node2D

@onready var travel_direction : Vector2
@onready var damage : float

func travel():
	global_position = (global_position + (travel_direction * 2))
