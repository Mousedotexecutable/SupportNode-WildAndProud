extends CharacterBody2D



func _physics_process(delta):
	
	var input_dirrection :Vector2 =  Vector2( Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up") )
	
	velocity = velocity.lerp( input_dirrection * 25, 5.0 * delta)
	
	
	move_and_slide()
	
	
	
	
