extends Node2D
	
	
func get_move_vector():
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("right")- Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down")- Input.get_action_strength("up")
	
	return direction.normalized()
