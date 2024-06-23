extends CharacterBody2D

@onready var origin_position :Vector2 = position

enum {pause, walking}

var walking_timer :float = 2.0
var pause_timer :float = 0.0

var time :float = 0.0

#var 
var current_state :int = 0
var walk_state :int = walking

func _physics_process(delta):
	
	time += 1 * delta
	
	pause_timer -= 1 * delta
	
	walking_timer -= 1 * delta
	print(walking_timer)
	
	if walk_state == walking:
		$Sprite2D.position.y = sin(time * 10)
		if $Sprite2D.position.y > 0:
			$Sprite2D.position.y = 0
			
		match(current_state):
			0:
				$Sprite2D.flip_h = true
				position.x = lerp( position.x , origin_position.x / 0.95, 1.0 * delta)
			1:
				$Sprite2D.flip_h = false
				position.x = lerp( position.x , origin_position.x * 0.95, 1.0 * delta)
			2:
				position.x = lerp( position.x , origin_position.x + randf_range(-5, 5), 1.0 * delta)
			
			
		if walking_timer < 0:
			walk_state = pause
			walking_timer = randf_range(2, 8)
			
	elif walk_state == pause:
		$Sprite2D.position.y = lerp($Sprite2D.position.y, 0.0, 5.0 * delta)
		if walking_timer < 0:
			walk_state = walking
			walking_timer = 2
			
			#current_state = 2
			
			if current_state == 0:
				$Sprite2D.flip_h = false
			elif current_state == 1:
				$Sprite2D.flip_h = true
			match(current_state):
				0, 1:
					current_state = 2
				2:
					#current_state = 1
					current_state = randi_range(0, 1)
		
	
	
	#if walking_timer <= 0:
		#pause_timer = 1.0
		#current_state = 2
		#if pause_timer < 0:
			#walking_timer = 1.0
