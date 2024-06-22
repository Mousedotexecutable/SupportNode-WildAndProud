extends CharacterBody2D

@export var Tilemap: TileMap
@export var Root: Node2D

func _physics_process(delta):
	
	var input_dirrection :Vector2 =  Vector2( Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up") )
	
	velocity = velocity.lerp( input_dirrection * 25, 5.0 * delta)
	
	
	move_and_slide()
	

func _on_area_2d_body_entered(body):
	print(body)
	if(body.has_method("Push")):
		if(Global.Glove):
			var PlayerTile = Tilemap.map_to_local(Tilemap.local_to_map(position))
			var BoxTile = Tilemap.map_to_local(Tilemap.local_to_map(body.position))
			if(PlayerTile.x == BoxTile.x):
				if(PlayerTile.y > BoxTile.y):
					body.Push("Up")
					print(PlayerTile.y)
					print(BoxTile.y)
				else:
					body.Push("Down")
					print(PlayerTile.y)
					print(BoxTile.y)
			elif(PlayerTile.y == BoxTile.y):
				if(PlayerTile.x > BoxTile.x):
					body.Push("Left")
					print(PlayerTile.x)
					print(BoxTile.x)
				else:
					body.Push("Right")
					print(PlayerTile.x)
					print(BoxTile.x)
