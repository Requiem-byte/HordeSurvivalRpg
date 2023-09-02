class_name Spawner
extends Node2D

@export var wave_manager : WaveManager
@export var entity_array : Array[PackedScene] = []
@export var entity_group : String = "enemies"
@export var spawner_texture : Texture

@onready var spawn_delay : float :
	#get spawn delay exported value THEN set the value
	get:
		return randf_range(1, 2)
	set(value):
		spawn_delay = clamp(value, 1, 2)
@onready var timer : Timer = $Timer
@onready var shouldSpawn : bool = true

@onready var group_unit = null

func _ready():
	if wave_manager == null: return
	wave_manager.start_spawning.connect(on_start_spawning)
	wave_manager.stop_spawning.connect(on_stop_spawning)
	$SpawnerTexture.texture = spawner_texture
	var group_array = get_tree().get_nodes_in_group(entity_group)
	if group_array.size() >= 1:
		group_unit = group_array[0]
	
	timer.wait_time = spawn_delay
	timer.timeout.connect(on_timer_timeout)
	timer.start()


func on_timer_timeout():
	if !shouldSpawn:
		timer.stop()
		return
	trigger_spawn()
	

func trigger_spawn():
	var entity = pick_entity()
	if entity == null: return
	if group_unit == null: return
	
	var entity_instance = entity.instantiate() as Node2D
	entity_instance.global_position = $SpawnPosition.global_position
	
	wave_manager.increment_count()
	group_unit.add_child(entity_instance)
	entity_instance.died.connect(on_unit_died)
	

func pick_entity():
	if entity_array.size() == 0: return
	var rand_value :int = randi_range(0, entity_array.size()-1)
	return entity_array[rand_value]
	
func on_start_spawning():
	shouldSpawn = true
	timer.start()
	
func on_stop_spawning():
	shouldSpawn = false

func on_unit_died():
	wave_manager.check_enemies_dead()
