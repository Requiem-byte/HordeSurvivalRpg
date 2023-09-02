class_name Tower
extends Node2D

@export var tower_stats : Resource = null
@export var health_component : HealthComponent = null
@export var bullet : PackedScene


func launch_bullet_instance(damage: float, pos:Vector2):
	if bullet == null: return
	
	var direction = (pos - global_position).normalized()
	var bullet_instance = bullet.instantiate() as Bullet

	if not bullet_instance is Bullet: return
	
	bullet_instance.global_position = global_position
	bullet_instance.rotation = rotation
	bullet_instance.travel_direction = direction
	bullet_instance.damage = damage
	
	return bullet_instance
	
func look_at_entity():
	
	var enemies_group = get_tree().get_nodes_in_group("enemies")
	
	
	
	
	
	rotation = (get_global_mouse_position() - global_position).angle()
