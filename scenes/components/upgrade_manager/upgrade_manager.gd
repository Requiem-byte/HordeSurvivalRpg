class_name UpgradeManager
extends Node

@export var upgrade_screen : PackedScene
@export var upgrade_pool : Array[AbilityUpgrade]

func _ready():
	print(upgrade_pool)
	EventsManager.select_ability.connect(on_select_ability)

func select_upgrades():
	
	var current_pool = upgrade_pool.duplicate()
	var selected_upgrades : Array[AbilityUpgrade] = []
	current_pool.shuffle()
	
	var upgrade_selection_count :int = 2
	
	if randf_range(0, 1) >= 0.75:
		upgrade_selection_count = 3

	for i in range(upgrade_selection_count):
		if current_pool.size() == 0: break
		var upgrade = current_pool.pop_back()
		selected_upgrades.append(upgrade)
	
	return selected_upgrades

func on_select_ability():
	var screen = upgrade_screen.instantiate() as UpgradeScreen
	screen.upgrade_selected.connect(on_upgrade_selected.bind())
	add_child(screen)
	screen.generate_cards(select_upgrades())
	get_tree().paused = true

func on_upgrade_selected(upgrade:AbilityUpgrade):
	EventsManager.apply_selected_ability(upgrade)
