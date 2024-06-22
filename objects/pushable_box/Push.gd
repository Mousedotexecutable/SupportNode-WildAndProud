extends AnimatableBody2D


func Push(Direction):
	match Direction:
		"Down":
			$RayCast2D.target_position = Vector2(0,8)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				position.y += 8
		"Up":
			$RayCast2D.target_position = Vector2(0,-8)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				position.y -= 8
		"Left":
			$RayCast2D.target_position = Vector2(-8,0)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				position.x -= 8
		"Right":
			$RayCast2D.target_position = Vector2(8,0)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				position.x += 8
	pass
