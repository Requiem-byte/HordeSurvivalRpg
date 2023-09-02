class_name DetectionZone
extends Area2D

signal enemy_location(location)

@export var timer : Timer

func _ready():
	timer.timeout.connect(on_timer_timeout)

	
func on_timer_timeout():
	var overlapping_areas = get_overlapping_areas()
	
	if overlapping_areas.size() == 0: return
	var nearest_enemy = get_nearest_enemy(overlapping_areas)
	enemy_location.emit(nearest_enemy.global_position)


func get_nearest_enemy(overlapping_areas: Array):
	
	var nearest_enemy : float = self.global_position.distance_to(overlapping_areas[0].global_position)
	var nearest_enemy_area = overlapping_areas[0]
	for enemy in overlapping_areas:
		if not enemy is HurtboxComponent: continue
		var current_enemy = enemy as Node2D
		var enemy_distance = self.global_position.distance_to(current_enemy.global_position)
		if enemy_distance < nearest_enemy:
			nearest_enemy = enemy_distance
			nearest_enemy_area = current_enemy as Node2D
	return nearest_enemy_area
