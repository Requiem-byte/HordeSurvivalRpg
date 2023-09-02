extends Bullet

@onready var hitbox : HitboxComponent = $HitboxComponent

func _ready():
	damage = 5
	hitbox.damage = damage
	travel_direction  = (get_global_mouse_position() - global_position).normalized()
	

func _physics_process(delta):
	travel()
