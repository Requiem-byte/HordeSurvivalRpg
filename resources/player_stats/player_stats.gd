extends Node

var health: float = 10
var speed: float = 200
var exp_multiplier: float = 0

var coins_possessed : float = 0

func increment_health(value : float):
	health += (health * value)
	health = round(health)

func increment_speed(value : float):
	speed += (speed * value)
	speed = roundf(speed)
	
func increment_exp_multiplier(value : float):
	exp_multiplier += (exp_multiplier * value)
