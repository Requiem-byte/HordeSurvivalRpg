extends Tower

@onready var body : Sprite2D = $Sprite2D
@onready var timer : Timer = $Timer
@onready var detection_zone : DetectionZone = $DetectionZone

@export var damage : float = 0

var bullet_con : Node2D

func _ready():
	body.frame = 0
	
	bullet_con = get_tree().get_first_node_in_group("bullet_container")
	detection_zone.enemy_location.connect(on_enemy_found.bind())

func _process(delta):
	look_to_enemy()

func on_timer_timeout():
	
	body.frame = 1
	
#	var bullet_instance = launch_bullet_instance(damage)
	
#	if bullet_con == null: return
#	bullet_con.add_child(bullet_instance)
	

func on_enemy_found(location : Vector2):
	
	if bullet_con == null: return
	var bullet_instance = launch_bullet_instance(damage, location)
	bullet_con.add_child(bullet_instance)
	
func look_to_enemy():
	var areas = detection_zone.get_overlapping_areas() as Array
	if areas.size() == 0: return
	rotation = (detection_zone.get_nearest_enemy(areas).global_position - global_position).normalized().angle()
	
