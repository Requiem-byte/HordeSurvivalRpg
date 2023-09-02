extends Node2D
class_name ExperienceManager

signal level_up

var current_level : float = 1

#the total amount of experience required to level up
var exp_to_next_level : float = 10
var current_exp : float = 0

func _ready():
	EventsManager.add_experience.connect(on_experience_collected)


func increment_exp(value : float):
	current_exp += value
	if current_exp >= exp_to_next_level: increment_level()
	print("current exp:     " + str(current_exp))
	print("current level:   " + str(current_level))
	print("exp to next lvl: " + str(exp_to_next_level))
	

func increment_level():
	current_level += 1
	current_exp = 0
	exp_to_next_level = get_new_level_exp_cap()
	level_up.emit()
	

func get_new_level_exp_cap():
	var current_max = exp_to_next_level
	var new_max = current_max + (current_max * 0.15)
	return new_max
	

func on_experience_collected(value : float):
	increment_exp(value)
