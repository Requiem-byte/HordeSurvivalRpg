extends Node
class_name HealthComponent

signal died

@export var current_health : float = 1
@export var MAX_HEALTH : float : set = set_health

func _ready():
	current_health = MAX_HEALTH

func damage(value : float):
	current_health -= value
	if current_health <= 0:
		died.emit()
		
func heal(value : float):
	current_health += value
	if current_health >= MAX_HEALTH:
		current_health = MAX_HEALTH

func set_health(health : float):
	MAX_HEALTH = max(health, 10)
