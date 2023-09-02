extends Node

signal add_experience(value : float)
signal select_ability
signal wave_complete
signal ability_selected(ability:AbilityUpgrade)

func experience_collected(value : float):
	add_experience.emit(value)

func get_snapped_mouse(mouse_pos:Vector2):
	var mouse = mouse_pos
	mouse.x = snapped(mouse.x, 16)
	mouse.y = snapped(mouse.y, 16)
	return mouse

func apply_selected_ability(ability : AbilityUpgrade):
	ability_selected.emit(ability)

func emit_select_ability():
	select_ability.emit()
