extends Enemy

@onready var nav_agent : NavigationComponent = $NavigationComponent
@onready var health_component : HealthComponent = $HealthComponent


func _ready():
	health_component.died.connect(on_died)


func _physics_process(delta):
	var new_velocity = nav_agent.return_process()
	if new_velocity == null: return
	velocity = new_velocity
	move_and_slide()


func on_died():
	var experience : ExperienceDropComponent = $ExperienceDropComponent
	experience.drop_exp()
	self.remove_from_group("enemies")
	died.emit()
	queue_free()
