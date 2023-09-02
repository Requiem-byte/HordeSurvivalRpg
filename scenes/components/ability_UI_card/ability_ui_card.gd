extends PanelContainer



func _on_mouse_entered():
	print("mouse entered")


func _on_gui_input(event):
	if event.is_action_pressed("mouse_left"):
		print("mouse clicked")
