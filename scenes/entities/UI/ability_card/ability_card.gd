class_name AbilityUICard
extends PanelContainer

signal upgrade_selected(upgrade : AbilityUpgrade)

@onready var title = $%Title
@onready var texture = $%Texture
@onready var type = $%Type

var self_upgrade : AbilityUpgrade

func _ready():
	gui_input.connect(on_gui_input)
	
func set_ability_upgrade(upgrade : AbilityUpgrade):
	self_upgrade = upgrade
	title.text = upgrade.title
	texture.texture = upgrade.texture
	type.text = upgrade.type

func on_gui_input(event : InputEvent):
	if event.is_action_pressed("mouse_left"):
		upgrade_selected.emit(self_upgrade)
