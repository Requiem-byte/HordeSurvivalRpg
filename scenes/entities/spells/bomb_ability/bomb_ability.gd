extends Bullet

@onready var impact_body : HitboxComponent = $DirectHitBox
@export var bomb_zone : PackedScene

func _ready():
	impact_body.area_entered.connect(on_area_entered)
	damage = 12
	travel_direction = (get_global_mouse_position() - global_position).normalized()

func _process(delta):
	travel()

func on_area_entered(other_area):
	if bomb_zone == null: return
	
	var zone_instance = bomb_zone.instantiate() as HitboxComponent
#	zone_instance.global_position = global_position
	add_child(zone_instance)
	zone_instance.damage = damage
