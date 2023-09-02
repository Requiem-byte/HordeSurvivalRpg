extends Node2D

@onready var label = $Label

@export_multiline var text = "null"

	
func _ready():
	label.text = text
	$Label.visible = false

func _on_area_2d_body_entered(body):
	$Label.visible = true

func _on_area_2d_body_exited(body):
	$Label.visible = false

func _on_area_2d_mouse_entered():
	$Label.visible = true

func _on_area_2d_mouse_exited():
	$Label.visible = false
