extends Node2D

@export var upgrade_manager : PackedScene

@export var abilities : Array[PackedScene] = [] 
@export var default_ability : PackedScene
@export var default_tower : PackedScene

var current_left : PackedScene = null
var current_right : PackedScene = null

func _ready():
	EventsManager.ability_selected.connect(on_new_ability_selected.bind())
	current_left = default_ability
	current_right = default_tower

func _input(event):
	
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null: return
	
	#Player controlled abilities
	if event.is_action_pressed("mouse_left"):
		
		# TODO add ability array or storing data type
		var left_instance = current_left.instantiate() as Node2D
		
		if left_instance is Bullet:
			left_instance.global_position = player.global_position
			get_tree().get_first_node_in_group("bullet_container").add_child(left_instance)
	
	#place towers into world
	if event.is_action_pressed("mouse_right"):
		if current_right == null: return
		
		var tower_instance = current_right.instantiate() as Node2D
		if tower_instance is Tower:
			var pos = EventsManager.get_snapped_mouse(get_global_mouse_position())
			for tower in get_tree().get_nodes_in_group("towers"):
				if pos == tower.global_position:
					return
			tower_instance.global_position = pos
			get_tree().get_first_node_in_group("tower_container").add_child(tower_instance)
		current_right = null

		
func on_new_ability_selected(ability:AbilityUpgrade):
	if ability.type.to_lower() == "tower":
		current_right = ability.scene
	elif ability.type.to_lower() == "ability":
		current_left = ability.scene
