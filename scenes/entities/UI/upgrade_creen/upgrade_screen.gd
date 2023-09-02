class_name UpgradeScreen
extends CanvasLayer

signal upgrade_selected(upgrade:AbilityUpgrade)

@export var ability_card_scene : PackedScene

func generate_cards(abilities : Array[AbilityUpgrade]):
	
	for upgrade in abilities:
		var ability = upgrade as AbilityUpgrade
		var card_instance = ability_card_scene.instantiate() as AbilityUICard
		$MarginContainer/AbilityCardContainerontainer.add_child(card_instance)
		card_instance.set_ability_upgrade(upgrade)
		card_instance.upgrade_selected.connect(on_upgrade_selected.bind())
		
func on_upgrade_selected(upgrade:AbilityUpgrade):
	get_tree().paused = false
	upgrade_selected.emit(upgrade)
	queue_free()
