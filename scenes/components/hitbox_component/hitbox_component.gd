class_name HurtboxComponent
extends Area2D

@export var health_component : HealthComponent


func _ready():
	area_entered.connect(on_area_entered)
	
func on_area_entered(other_area):
	if not other_area is HitboxComponent: return
	if health_component == null: return
	var hurt = other_area as HitboxComponent
	health_component.damage(hurt.damage)
