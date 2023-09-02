extends NavigationAgent2D
class_name NavigationComponent

@export var nav_target : String

@onready var current_target

func _ready():
	current_target = get_current_target_position()
	if current_target == null:
		return
	self.target_position = current_target
	

func return_process():
	if current_target == null: 
		return
	if self.is_target_reached():
		return
	current_target = get_current_target_position()
	self.target_position = current_target
	var next_path_position = self.get_next_path_position()
	var current_position = owner.global_position
	var new_velocity = (next_path_position - current_position).normalized() * 50
	return new_velocity
	

func get_current_target_position():
	if nav_target == "":
		return
	var target = get_tree().get_nodes_in_group(nav_target)
	if target:
		return target[0].global_position
