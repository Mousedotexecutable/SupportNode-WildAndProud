extends CharacterBody2D

@export var Tilemap: TileMap

func _physics_process(delta):
	
	var input_dirrection :Vector2 =  Vector2( Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up") )
	
	velocity = velocity.lerp( input_dirrection * 25, 5.0 * delta)
	
	
	move_and_slide()
	
	#When Raft is True disable mask 6 collision
	#Check for Raft
	if(Global.Raft):
		#Tilemap data = null = Ground, Tilemap data != null = water
		if(Tilemap.get_cell_tile_data(0, Tilemap.local_to_map(position)) != null):
			if(not $RaftSprite.visible):
				$RaftSprite.show()
				$Sprite2D.hide()
		else:
			if($RaftSprite.visible):
				$Sprite2D.show()
				$RaftSprite.hide()
			

func _on_area_2d_body_entered(body):
	if(body.has_method("Push")):
		if(Global.Glove):
			var PlayerTile = Tilemap.map_to_local(Tilemap.local_to_map(position))
			var BoxTile = Tilemap.map_to_local(Tilemap.local_to_map(body.position))
			if(PlayerTile.x == BoxTile.x):
				if(PlayerTile.y > BoxTile.y):
					body.Push("Up")
				else:
					body.Push("Down")
			elif(PlayerTile.y == BoxTile.y):
				if(PlayerTile.x > BoxTile.x):
					body.Push("Left")
				else:
					body.Push("Right")
	elif(body.has_method("Burn")):
		if(Global.Fire):
			body.Burn()
