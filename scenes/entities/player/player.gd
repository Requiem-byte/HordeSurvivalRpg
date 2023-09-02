extends CharacterBody2D

@onready var health_component = $HealthComponent as HealthComponent

var speed : float

func _ready():
	health_component.MAX_HEALTH = PlayerStats.health
	speed = PlayerStats.speed
	print("Health : %s\nSpeed : %s" % [health_component.current_health, speed])

func _process(delta):
	var move_vector = $VelocityComponent.get_move_vector()
	velocity = lerp(velocity, (move_vector * speed), 0.3)
	move_and_slide()

func _input(event):
	if event.is_action_pressed("mouse_right"):
		EventsManager.experience_collected(5 )
