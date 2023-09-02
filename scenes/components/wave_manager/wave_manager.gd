class_name WaveManager
extends Node

signal stop_spawning
signal start_spawning

@onready var timer = $Timer

@export var max_entity_count : int
var current_entity_count : int

@export var wave_start_time : float = 1
var current_wave : float = 1
var increased_entities_per_wave : float = 3

func _ready():
	timer.timeout.connect(on_timer_timeout)
	timer.wait_time = wave_start_time

func increment_count():
	current_entity_count += 1
	if current_entity_count >= max_entity_count:
		stop_spawning.emit()
		
func check_enemies_dead():
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() <= 0:
		current_entity_count = 0
		current_wave += 1
		max_entity_count += increased_entities_per_wave
		EventsManager.emit_select_ability()
		start_timer()
		
func start_timer():
	timer.start()

func on_timer_timeout():
	start_spawning.emit()
