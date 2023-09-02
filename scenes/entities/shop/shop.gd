extends Node2D

var entered_shop_area : bool = false

func _ready():
	$Area2D.body_entered.connect(on_shop_entered)
	$Area2D.body_exited.connect(on_shop_exited)
	print(PlayerStats.health)
	$E.visible = false
	
	
func on_shop_entered(_body):
	print("entered")
	$E.visible = true
	entered_shop_area = true
	
func on_shop_exited(_body):
	print("exited")
	$E.visible = false
	entered_shop_area = false
	
func _input(event):
	if event.is_action_pressed("mouse_left") && entered_shop_area:
		print("You bought stuff")
		PlayerStats.increment_health(0.1)
		print(PlayerStats.health)
