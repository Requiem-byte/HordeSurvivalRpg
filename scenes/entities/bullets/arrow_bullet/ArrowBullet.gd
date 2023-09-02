extends Bullet

@onready var hitbox_component : HitboxComponent = $HitboxComponent

func _ready():
	hitbox_component.damage = damage

func _physics_process(delta):
	travel()
