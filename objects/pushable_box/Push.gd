extends AnimatableBody2D


func Push(Direction):
	var push_dirrection :Vector2 = Vector2.ZERO
	match Direction:
		"Down":
			$RayCast2D.target_position = Vector2(0,8)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				push_dirrection.y += 8
		"Up":
			$RayCast2D.target_position = Vector2(0,-8)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				push_dirrection.y -= 8
		"Left":
			$RayCast2D.target_position = Vector2(-8,0)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				push_dirrection.x -= 8
		"Right":
			$RayCast2D.target_position = Vector2(8,0)
			$RayCast2D.force_raycast_update()
			if(not $RayCast2D.is_colliding()):
				push_dirrection.x += 8
	
	var tween = get_tree().create_tween().tween_property(self, "position", position + push_dirrection, 0.1 ).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
