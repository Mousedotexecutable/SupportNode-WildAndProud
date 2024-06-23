extends Camera2D

@export var PLAYER_REFERENCE :CharacterBody2D

func _process(delta):
	
	
	if PLAYER_REFERENCE.global_position.x > global_position.x + 120:
		global_position.x += 120
	elif PLAYER_REFERENCE.global_position.x < global_position.x:
		global_position.x -= 120
	
	if PLAYER_REFERENCE.global_position.y > global_position.y + 80:
		global_position.y += 80
	elif PLAYER_REFERENCE.global_position.y < global_position.y:
		global_position.y -= 80
