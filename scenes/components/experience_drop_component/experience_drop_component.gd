extends Node2D
class_name ExperienceDropComponent

@export var experience : float = 5

func drop_exp():
	EventsManager.experience_collected(experience)
